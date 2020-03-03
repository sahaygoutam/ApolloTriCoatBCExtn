tableextension 50108 ItemLedgerEntryExt extends "Item Ledger Entry"
{
    fields
    {
        field(50100; Width; Decimal) { }
        field(50101; Thickness; Decimal) { }
        field(50102; Grade; Option) { OptionMembers = ""; }
        field(50103; "Vendor Batch No."; Code[20]) { }
        field(50104; "BSL Batch No."; Code[20]) { }
        field(50105; "Actual Wiidth"; Decimal) { }
        field(50106; "Actual Thickness"; Decimal) { }
        field(50107; "Actual Grade"; Option) { OptionMembers = ""; }
        field(50108; "Alternate Unit of measure"; Code[10]) { }
        field(50109; "Alternate Qty"; Decimal) { }
        field(50110; "Actual Qty."; Decimal) { }
        field(50111; Length; Decimal) { }
        field(50112; Stamp; Option) { OptionMembers = ""; }
        field(50113; "End Condition"; Option) { OptionMembers = ""; }
        field(50114; "Surface Condition"; Option) { OptionMembers = ""; }
        field(50115; Size; Code[20]) { }
        field(50116; "Delivery Remark"; Text[50]) { }
        field(50117; "Special Remark"; Text[50]) { }
        field(50118; "IS Specifications"; Option) { OptionMembers = ""; }
        field(50119; "Outer Diameter"; Decimal) { }
        field(50122; Bundle; Integer) { }
        field(50124; "Posted Gate Entry No."; Code[20]) { }
        field(50125; "Item Classification"; Code[20]) { }
        field(50126; "Pcs/Bundle"; Decimal) { }
        field(50127; LMH; Option) { OptionMembers = ""; }
        field(50128; "Rejected Location"; Boolean) { }
        field(50129; "Scrap Item"; Boolean) { }
        field(50130; "Inner Diameter"; Decimal) { }
        field(50131; "Subcontracting RGP No."; Code[20]) { }
        field(50132; "Subcontracting RGP Line No."; Integer) { }
        field(50133; "Subcontracting Sales Order No."; Code[20]) { }
        field(50134; "Short/Excess Qty"; Decimal) { }
        field(50135; "Accept Batch"; Boolean) { }
        field(50136; "Rejected Batch"; Boolean) { }
        field(50137; "Location Name"; Text[50]) { }
        field(50138; "Licence No."; Code[20]) { }
        field(50139; "Actual Qty Sold"; Decimal) { }
        field(50140; "Gross Weight"; Decimal) { }
        field(50141; "Subcontracting Batch Select"; Boolean) { }
        field(50142; "No. of Bundle"; Integer) { }
        field(50143; OuterDia; Decimal) { }
        field(50145; InnerDia; Decimal) { }
    }

    var
        myInt: Integer;
}