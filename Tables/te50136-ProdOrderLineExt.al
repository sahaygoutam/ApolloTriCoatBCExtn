tableextension 50136 ProdOrderLineExt extends "Prod. Order Line"
{
    fields
    {
        field(50100; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50101; Length; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; Grade; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
        }
        field(50103; "No. of Bundle"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Alternate UOM"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(50105; OD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50106; "IS Specs"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","IS-1239","IS-3601","IS-4923","IS-1161","IS-3589","IS-9295","IS-4270","ASTMA-500","BS-1387","EN-1021";
        }
        field(50107; Stamp; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","APL Apollo",Green,"Without Stamp";
        }
        field(50108; Size; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnLookup()
            var
                SizeLoc: Record "Master Setup";
            begin
                SizeLoc.RESET;
                SizeLoc.SETRANGE("Default Code", 'SIZE');
                SizeLoc.SETRANGE("Default Code Value", Size);
                IF NOT SizeLoc.FINDFIRST THEN
                    ERROR(STRSUBSTNO('Value of Field Size %1 is not valid', Size));
            end;

            trigger OnValidate()
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
        field(50110; Shift; Code[1])
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Machine No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Machine Center"."No.";
        }
        field(50112; "Number of Batch"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50113; ID; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50114; "End Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Plane End","Bevel End",SWS,SS;
        }
        field(50115; "Surface Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Varnished,"Self Colour",Voild;
        }
        field(50116; "Alternate Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50117; Width; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50118; "Item Classification"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Classification"."Item Classification Type" WHERE ("Item Category Code" = FIELD ("Item Category Code"));
        }
        field(50119; "Pcs/Bundle"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50120; "Item Category Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category";
        }
        field(50121; "Product Group Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Product Group".Code WHERE ("Item Category Code" = FIELD ("Item Category Code"));
        }
        field(50122; "Work Shift Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Work Shift";
        }
        field(50123; "Posted Production Order Line"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50124; "QC Enable"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}