table 50109 "PDC Details"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Issue Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Cheque Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Cheque Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Status; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Already Selected"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Posted Bank Recipt No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Customer No.", "Line No.")
        {
            Clustered = true;
        }
    }
}