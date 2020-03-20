table 50117 "Loan Management"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Loan No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Date of Issue"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Loan Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Tenure Days"; DateFormula)
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Rate of Interest"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(7; "No. of Installments"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(10; "Premium Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(11; "Loan Bank Name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(12; "Total Loan Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(13; "Loan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Payment,Receive;
        }
    }

    keys
    {
        key(PK; "Loan No.", "Posting Date", "Date of Issue", "Loan Amount", "Document No.")
        {
            Clustered = true;
        }
    }
}