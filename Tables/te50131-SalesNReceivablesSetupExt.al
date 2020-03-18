tableextension 50131 SalesNReceivablesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Reminder Frequency"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Grace Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Tolerance Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Tolerance UOM"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(50104; "Inward Service G/L"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account" WHERE ("Inward Service G/L" = FILTER (true));
        }
        field(50105; "Sales Status UOM"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
    }
}