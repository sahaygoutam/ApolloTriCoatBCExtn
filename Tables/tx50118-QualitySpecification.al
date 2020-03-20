table 50118 "Quality Specification"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Qualitative,Quantitive;
        }
        field(3; Description; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Min Value"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Max Value"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Descriptive Value"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Pass,Fail;
        }
    }

    keys
    {
        key(PK; Code, Type)
        {
            Clustered = true;
        }
    }
}