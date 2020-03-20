tableextension 50138 FixedAssetExt extends "Fixed Asset"
{
    fields
    {
        field(50100; "Commisioning Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Salvage Value %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Skip Salvage Value Calculation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}