table 50106 "Indent Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20]) { }
        field(2; "Line No."; Integer) { }
        field(3; "No."; Code[20]) { }
        field(4; Description; Text[250]) { }
        field(5; "Description 2"; Text[250]) { }
        field(6; Quantity; Decimal) { }
        field(7; UOM; Code[10]) { }
        field(8; "Expected Cost"; Decimal) { }
        field(9; Remarks; Text[250]) { }
        field(10; Status; Option) { OptionMembers = ""; }
        field(11; "Technical Specification"; Text[250]) { }
        field(12; "PO Approve Qty"; Decimal) { }
        field(13; "PO Received Qty"; Decimal) { }
        field(14; "Approval Status"; Option) { OptionMembers = ""; }
        field(15; Location; Code[20]) { }
        field(16; "Vendor Exist"; Integer) { }
        field(17; "Multi Vendor Status"; Option) { OptionMembers = ""; }
        field(18; "Unit of Measure Code"; Code[10]) { }
        field(19; "Variant Code"; Code[10]) { }
        field(20; "Approval User ID"; Code[50]) { }
        field(21; "Indent Date"; Date) { }
        field(22; "No. of PO"; Integer) { }
        field(23; "Stock In Hand"; Decimal) { }
        field(24; Type; Option) { OptionMembers = " "; }
        field(25; "Remaining Qty"; Decimal) { }
        field(26; "Due Date"; Date) { }
        field(27; "Approx Cost"; Decimal) { }
        field(28; "Internal Job No."; Code[20]) { }
        field(29; "Approved Date"; Date) { }
        field(30; "Batch Creation"; Boolean) { }
        field(31; "Job No."; Code[20]) { }
        field(32; "Reason Code"; Code[20]) { }
        field(33; "Item Category Code"; Code[20]) { }
        field(34; "Responsibility Center"; Code[20]) { }
        field(35; "From Location"; Code[20]) { }
        field(36; "Chicks Item"; Boolean) { }
        field(37; Grade; Option) { OptionMembers = ""; }
        field(38; Thickness; Decimal) { }
        field(39; Width; Decimal) { }
        field(40; "Released Status"; Option) { OptionMembers = ""; }
        field(41; "User Name"; Text[250]) { }
        field(42; "User ID"; Code[50]) { }
        field(43; "Capital Items"; Boolean) { }
        field(44; "Completely Received"; Boolean) { }
        field(45; "Shortcut Dimension 1 Code"; Code[10]) { }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}