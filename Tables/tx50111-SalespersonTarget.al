table 50111 "Salesperson Target"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Sales Person Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "Target Amount" <> 0 THEN
                    ERROR('Target Amount should be blank');
            end;
        }
        field(5; "Target Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "Target Qty" <> 0 THEN
                    ERROR('Target Qty should be blank');
            end;
        }
        field(6; "Calculation Basis"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Commision %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Commision Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Unit of Measure"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Sales Person Code", "Line No.")
        {
            Clustered = true;
        }
    }
}