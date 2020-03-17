tableextension 50123 SalesCrMemoLineExt extends "Sales Cr.Memo Line"
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
        field(50102; Stamp; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","APL Appollo",Green,"Without Stamp";
        }
        field(50103; "Pipe Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Black,GI,GP;
        }
        field(50104; "End Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Plane End","Bevel End",SWS,SS;
        }
        field(50105; "Surface Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Varnished,"Self Colour",Voild;
        }
        field(50106; Size; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Delivery Remark"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Special Remark"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50109; "IS Specifications"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","IS-1239","IS-3601","IS-4923","IS-1161","IS-3589","IS-9295","IS-4270","ASTMA-500","BS-1387","EN-1021";
        }
        field(50110; "Outer Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Alternate UOM"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Alternate Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50113; Bundle; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50114; Grade; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
        }
        field(50115; "Posted Gate Entry No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50116; Width; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50117; "Item Classification"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50118; "Pcs/Bundle"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50119; LMH; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Light,Medium,Heavy;
        }
        field(50120; "Excess Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50121; "Excess Qty (Base)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50122; "Subcontracting RGP No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50123; "Sales Order Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Distributor,SEZ,Export,Dealer,Institutional,"Deemed Export","Job Work","Scrap Sale";
        }
        field(50124; "Licence No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50125; "Amt. to Customer"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50126; "Tolerance %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50127; "Order Category Type"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

}