tableextension 50109 LocationExt extends Location
{
    fields
    {
        field(50100; "Scrap Location"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Reject Location"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Inward Jobwork Location"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Location Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Main,Demo,Scheme,DoA,B2B;
        }
        field(50104; "Responsibility Center"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
    }
}