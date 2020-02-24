table 50110 "Batch Weight Creation"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "";
        }
        field(2; "Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Document Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Lot No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Weight; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. of Coils"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Qty. Per Unit of Measure"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Vendor Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Select Batch"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Posted Batch"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Qty. to Ship"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Quantity Shipped"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Document Type", "Order No.", "Line No.", "Document Line No.")
        {
            Clustered = true;
        }
        key(PK1; "Document Type", "Order No.", "Line No.", Posted)
        {
            SumIndexFields = "No. of Coils", Weight;
        }
    }
}