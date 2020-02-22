tableextension 50101 UserSetupExt extends "User Setup"
{
    fields
    {
        field(50100; "Allow Indent Line Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Unlimited Indent Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "HO Users"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Responsibility Center"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50106; "Excess Consumption mail"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Allow Short Close"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Send SMS - Sales Status"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50109; "Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Master Edit"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Allow Order Posting"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Receive,Invoice,"Receive and Invoice",All;
        }
        field(50112; "Allow PI Posting"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",CA,CONS,FG,LICENSE,RM,SCR,SFG;
        }
        field(50113; "PriceList View"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50114; "SO Open"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50115; "Posting By Pass"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50116; "Allowed Posting Doc No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50117; "YesterdayPostingAllowed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}