tableextension 50139 FADepreciationBookExt extends "FA Depreciation Book"
{
    fields
    {
        field(50100; "Sal. Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Posted value"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}