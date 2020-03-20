table 50119 "Item Quality Specification"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "QC Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "QC Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Qualitative,Quantitive;
        }
        field(4; "Min Value"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Max Value"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Text001: TextConst ENU = 'Maximun value Should not be less then Minimum value';
            begin
                IF "Min Value" > "Max Value" THEN
                    ERROR(Text001);
            end;
        }
        field(6; "Descriptive Value"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Pass,Fail;
        }
        field(7; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(8; Description; Text[50])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; "Item No.", "QC Code", "QC Type")
        {
            Clustered = true;
        }
    }
}