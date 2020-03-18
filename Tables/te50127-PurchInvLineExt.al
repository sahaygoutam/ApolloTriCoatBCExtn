tableextension 50127 PurchInvLineExt extends "Purch. Inv. Line"
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
        field(50103; "QTY.In-Transit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Vendor Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "BSL Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50106; "Actual Width"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Actual Thickness"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Actual Grade"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
        }
        field(50109; "Alternate Unit of measure"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Alternate Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Indent No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Indent Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "Actual Qty."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50114; "Number of Coils"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50115; "Total Freight Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50116; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50117; Length; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50118; Stamp; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","APL Apollo",Green,"Without Stamp";
        }
        field(50119; "End Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Plane End","Bevel End",SWS,SS;
            Editable = false;
        }
        field(50120; "Surface Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Varnished,"Self Colour",Voild;
            Editable = false;
        }
        field(50121; Size; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50122; "IS Specifications"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","IS-1239","IS-3601","IS-4923","IS-1161","IS-3589","IS-9295","IS-4270","ASTMA-500","BS-1387","EN-1021";
        }
        field(50123; "Outer Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50124; Bundle; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50125; "Item Classification"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50126; "Pcs/Bundle"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50127; "Inner Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50128; "Licence No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50129; "Short/Excess Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50130; "Shortcut Dimension 8 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50131; Project; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50132; "Excess Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50133; "Salvage Value %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50134; "Remaining Budget Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50135; "INR Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50136; "Short Closed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50137; "Order Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",RM,Consumable,Service,Import,"Capital Order";
        }
        field(50138; "QC Enabled"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}