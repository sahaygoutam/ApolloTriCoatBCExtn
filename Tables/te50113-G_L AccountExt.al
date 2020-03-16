tableextension 50113 G_LAccountExt extends "G/L Account"
{
    fields
    {
        field(50100; "Payment Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Inward Service G/L"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Neg. Bal. Nt Allow."; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}