tableextension 50112 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50100; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                UpdateUnitPrice(FIELDNO(Thickness));
            end;
        }
        field(50101; Length; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                UpdateUnitPrice(FIELDNO(Length));
            end;
        }
        field(50102; Stamp; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = " ","APL Apollo",Green,"Without Stamp";
        }
        field(50103; "Pipe type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = " ",Black,GI,GP;
        }
        field(50104; "End Condition"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = " ","Plain End","Bevel End",SWS,SS;
            trigger OnValidate()
            begin
                UpdateUnitPrice(FIELDNO("End Condition"));
            end;
        }
        field(50105; "Surface Condition"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = " ",Varnished,"Self Colour",Voild;
        }
        field(50106; Size; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                UpdateUnitPrice(FIELDNO(Size));
            end;

            trigger OnLookup()
            var
                SizeLoc: Record "Master Setup";
            begin
                IF Size = '' THEN BEGIN
                    SizeLoc.RESET;
                    SizeLoc.SETRANGE("Default Code", 'SIZE');
                    IF SizeLoc.FINDSET THEN
                        IF PAGE.RUNMODAL(50024, SizeLoc) = ACTION::LookupOK THEN
                            VALIDATE(Size, SizeLoc."Default Code Value");
                END;
            end;
        }
        field(50107; "Delivery Remark"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50108; "Special Remark"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50109; "IS Specifications"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = " ",Special,"IS-1239","IS-3601","IS-4923","IS-1161","IS-3589","IS-9295","IS-4270","ASTMA-500","BS-1387","EN-1021";
        }
        field(50110; "Outer Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50111; "Alternate UOM"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Unit of Measure".Code;
        }
        field(50112; "Alternate Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50113; Bundle; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Sum ("Packing Details".Bundle WHERE ("Sales Order No." = FIELD ("Document No."), "Sales Order Line No." = FIELD ("Line No."), "Sales Shipment No." = FILTER ('')));
        }
        field(50114; Grade; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
        }
        field(50115; "Posted Gate Entry No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50116; Width; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50117; "Item Classification"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Item Classification"."Item Classification Type" WHERE ("Item Category Code" = FIELD ("Item Category Code"));
            trigger OnValidate()
            begin
                UpdateUnitPrice(FIELDNO("Item Classification"));
            end;
        }
        field(50118; "Pcs/Bundle"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum ("Packing Details"."Total Pcs" WHERE ("Sales Order No." = FIELD ("Document No."), "Sales Order Line No." = FIELD ("Line No."), "Sales Shipment No." = FILTER ('')));
        }
        field(50119; LMH; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = " ",Light,Medium,Heavy;
            trigger OnValidate()
            begin
                UpdateUnitPrice(FIELDNO(LMH));
            end;
        }
        field(50120; "Excess Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                "Excess Qty (Base)" := CalcBaseQty("Excess Qty");
            end;
        }
        field(50121; "Excess Qty (Base)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50122; "Subcontracting RGP No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50123; "Sales Order Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = " ",Distributor,SEZ,Export,Dealer,Institutional,"Deemed Export","Job Work","Scrap Sale";
        }
        field(50124; "Licence No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50125; "Amt. to Customer"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50126; "Tolerance %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                VALIDATE("Excess Qty", ((Quantity * "Tolerance %") / 100));
            end;
        }
        field(50127; "Order Category Type"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    local procedure CalcBaseQty(Qty: Decimal): Decimal
    begin
        TESTFIELD("Qty. per Unit of Measure");
        EXIT(ROUND(Qty * "Qty. per Unit of Measure", 0.00001));
    end;
}