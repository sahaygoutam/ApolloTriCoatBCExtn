tableextension 50109 LocationExt extends Location
{
    fields
    {
        field(50000; "Scrap Location"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Reject Location"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Inward Jobwork Location"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Location Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Main,Demo,Scheme,DoA,B2B;
        }
        field(50004; "Responsibility Center"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
    }
}