table 50108 "Transit Detail"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Line"."Document No.";
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Line"."Line No." WHERE ("Document No." = FIELD ("Document No."));
        }
        field(3; "QTY.In-Transit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Doc. Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Vender Inv. No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Vehicle No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Rack No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Posted Purch. Rcpt"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "LR/RR No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "LR/RR Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Gate Entry No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Vendor Batch No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.", "QTY.In-Transit", "Doc. Date", "Vender Inv. No.", "Vehicle No.", "Rack No.")
        {
            Clustered = true;
        }
    }
}