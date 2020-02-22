table 50106 "Indent Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Description 2"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; UOM; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Expected Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Close;
        }
        field(11; "Technical Specification"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "PO Approve Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "PO Received Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Approved,Closed,Rejected,"Pending Approval",Issued;
        }
        field(15; Location; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Vendor Exist"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Multi Vendor Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Approved;
        }
        field(18; "Unit of Measure Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Variant Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Approval User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Indent Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "No. of PO"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Stock In Hand"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Item,"Fixed Asset";
        }
        field(25; "Remaining Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Approx Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Internal Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Approved Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Batch Creation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Reason Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Item Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "From Location"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Chicks Item"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(37; Grade; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05","G15";
        }
        field(38; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(39; Width; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Released Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Released,Cancel,Close,"Pending Approval";
        }
        field(41; "User Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Capital Items"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Completely Received"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Shortcut Dimension 1 Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
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