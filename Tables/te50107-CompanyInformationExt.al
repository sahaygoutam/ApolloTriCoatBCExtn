tableextension 50107 CompanyInformationExt extends "Company Information"
{
    fields
    {
        field(50100; "C.I.N No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Regd. Address"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Regd. Address2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50103; Picture2; BLOB)
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Trading Co."; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}