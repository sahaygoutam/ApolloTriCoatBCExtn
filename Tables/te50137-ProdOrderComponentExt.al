tableextension 50137 ProdOrderComponentExt extends "Prod. Order Component"
{
    fields
    {
        field(50100; "Scrap Item"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Posted Component Line"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50103; Grade; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
        }
        field(50104; "No. of Bundle"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Alternate UOM"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(50106; OD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "IS Specs"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","IS-1239","IS-3601","IS-4923","IS-1161","IS-3589","IS-9295","IS-4270","ASTMA-500","BS-1387","EN-1021";
        }
        field(50108; Stamp; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","APL Appollo",Green,"Without Stamp";
        }
        field(50109; Size; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50110; ID; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "End Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Plane End","Bevel End",SWS,SS;
        }
        field(50112; "Surface Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Varnished,"Self Colour",Voild;
        }
        field(50113; "Alternate Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50114; "Item Classification"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Classification"."Item Classification Type" WHERE ("Item Category Code" = FIELD ("Item Category Code"));
        }
        field(50115; "Pcs/Bundle"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50116; "Item Category Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category";
        }
        field(50117; "Product Group Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Product Group".Code WHERE ("Item Category Code" = FIELD ("Item Category Code"));
        }
    }
}