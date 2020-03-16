tableextension 50116 ItemJournalLineExt extends "Item Journal Line"
{
    fields
    {
        field(50100; Width; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50101; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; Grade; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
        }
        field(50103; "Vendor Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "BSL Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Actual Wiidth"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50106; "Actual Thickness"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Actual Grade"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
        }
        field(50108; "Alternate Unit of measure"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50109; "Alternate Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Actual Qty."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; Length; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50112; Stamp; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","APL Apollo",Green,"Without Stamp";
        }
        field(50113; "End Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Plane End","Bevel End",SWS,SS;
        }
        field(50114; "Surface Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Varnished,"Self Colour",Voild;
        }
        field(50115; Size; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50116; "Delivery Remark"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50117; "Special Remark"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50118; "IS Specifications"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","IS-1239","IS-3601","IS-4923","IS-1161","IS-3589","IS-9295","IS-4270","ASTMA-500","BS-1387","EN-1021";
        }
        field(50119; "Outer Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50120; Bundle; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50121; "Number of Batch"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50122; "Posted Gate Entry No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50123; "Item Classification"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Classification"."Item Classification Type" WHERE ("Item Category Code" = FIELD ("Item Category Code"));
        }
        field(50124; "Pcs/Bundle"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50125; LMH; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Light,Medium,Heavy;
        }
        field(50126; "Rejected Location"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50127; "Scrap Item"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50128; "Inner Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50129; "Short/Excess Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50130; "DC Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50131; "Licence No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50132; "Actual Qty Sold"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50133; "Gross Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50134; "Subcontracting Sales Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50135; OD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50136; "IS Specs"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","IS-1239","IS-3601","IS-4923","IS-1161","IS-3589","IS-9295","IS-4270","ASTMA-500","BS-1387","EN-1021";
        }
        field(50137; ID; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50138; "Alternate Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}