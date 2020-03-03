tableextension 50106 PurchaseLineExt extends "Purchase Line"
{
    fields
    {
        field(50100; Width; Decimal) { }
        field(50101; Thickness; Decimal) { }
        field(50102; Grade; Option) { OptionMembers = ""; }
        field(50103; "QTY.In-Transit"; Decimal) { }
        field(50104; "Vendor Batch No."; Code[20]) { }
        field(50105; "BSL Batch No."; Code[20]) { }
        field(50106; "Actual Width"; Decimal) { }
        field(50107; "Actual Thickness"; Decimal) { }
        field(50108; "Actual Grade"; Option) { OptionMembers = ""; }
        field(50109; "Alternate Unit of measure"; Code[10]) { }
        field(50110; "Alternate Qty"; Decimal) { }
        field(50111; "Indent No."; Code[20]) { }
        field(50112; "Indent Line No."; Integer) { }
        field(50113; "Actual Qty."; Decimal) { }
        field(50114; "No. of Batch"; Integer) { }
        field(50115; "Total Freight Amount"; Decimal) { }
        field(50116; Remarks; Text[250]) { }
        field(50117; Length; Decimal) { }
        field(50118; Stamp; Option) { OptionMembers = ""; }
        field(50119; "End Condition"; Option) { OptionMembers = ""; }
        field(50120; "Surface Condition"; Option) { OptionMembers = ""; }
        field(50121; Size; Code[20]) { }
        field(50122; "IS Specifications"; Option) { OptionMembers = ""; }
        field(50123; "Outer Diameter"; Decimal) { }
        field(50124; Bundle; Integer) { }
        field(50125; "Item Classification"; Code[20]) { }
        field(50126; "Pcs/Bundle"; Decimal) { }
        field(50127; "Inner Diameter"; Decimal) { }
        field(50128; "Licence No."; Code[20]) { }
        field(50129; "Short/Excess Qty"; Decimal) { }
        field(50130; "Shortcut Dimension 8 Code"; Code[20]) { }
        field(50131; Project; Boolean) { }
        field(50132; "Excess Qty"; Decimal) { }
        field(50133; "Salvage Value %"; Decimal) { }
        field(50134; "Remaining Budget Value"; Decimal) { }
        field(50135; "INR Value"; Decimal) { }
        field(50136; "Short Closed"; Boolean) { }
        field(50137; "Order Type"; Option) { OptionMembers = ""; }
        field(50138; "QC Enabled"; Boolean) { }
        field(50139; "Other Charges"; Option) { OptionMembers = ""; }
        field(50140; "Last Modify By"; Code[50]) { }
        field(50141; "Excise Loading on Inventory"; Boolean) { }
    }

}