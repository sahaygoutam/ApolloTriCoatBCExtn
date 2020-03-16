tableextension 50108 ItemLedgerEntryExt extends "Item Ledger Entry"
{
    fields
    {
        field(50100; Width; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50101; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50102; Grade; Option)
        {
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50103; "Vendor Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50104; "BSL Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50105; "Actual Wiidth"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50106; "Actual Thickness"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50107; "Actual Grade"; Option)
        {
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50108; "Alternate Unit of measure"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50109; "Alternate Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50110; "Actual Qty."; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50111; Length; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50112; Stamp; Option)
        {
            OptionMembers = " ","APL Apollo",Green,"Without Stamp";
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50113; "End Condition"; Option)
        {
            OptionMembers = " ","Plane End","Bevel End",SWS,SS;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50114; "Surface Condition"; Option)
        {
            OptionMembers = " ",Varnished,"Self Colour",Voild;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50115; Size; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50116; "Delivery Remark"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50117; "Special Remark"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50118; "IS Specifications"; Option)
        {
            OptionMembers = " ","IS-1239","IS-3601","IS-4923","IS-1161","IS-3589","IS-9295","IS-4270","ASTMA-500","BS-1387","EN-1021";
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50119; "Outer Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50122; Bundle; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50124; "Posted Gate Entry No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50125; "Item Classification"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50126; "Pcs/Bundle"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50127; LMH; Option)
        {
            OptionMembers = " ",Light,Medium,Heavy;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50128; "Rejected Location"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50129; "Scrap Item"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50130; "Inner Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50131; "Subcontracting RGP No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50132; "Subcontracting RGP Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50133; "Subcontracting Sales Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50134; "Short/Excess Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50135; "Accept Batch"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50136; "Rejected Batch"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50137; "Location Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50138; "Licence No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50139; "Actual Qty Sold"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50140; "Gross Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50141; "Subcontracting Batch Select"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50142; "No. of Bundle"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50143; OuterDia; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50145; InnerDia; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}