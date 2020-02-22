table 50103 "Issue Slip Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "From Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(3; "Required Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(4; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "From Location Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Required Location Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Requisition,Posted,"Short Close";
        }
        field(9; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1), Blocked = CONST (false));
        }
        field(10; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2), Blocked = CONST (false));
        }
        field(11; "Shortcut Dimension 3 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (3), Blocked = CONST (false));
        }
        field(12; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Cost Center Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
    }

    keys
    {
        key(PK; "No.", "From Location Code")
        {
            Clustered = true;
        }
    }

    var
        RC: Record "Responsibility Center";
        UserSetup: Record "User Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Loc: Record Location;
        LocFlow: Record "Issue Slip Line";
        DimMgt: Codeunit DimensionManagement;
        //IssueSlipvalidate : Codeunit "Issue Slip validate";
        InvtSetup: Record "Inventory Setup";
        UserSetup_Rec: Record "User Setup";
        IssueSlipLine: Record "Issue Slip Line";

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            UserSetup.GET(USERID);
            UserSetup.TESTFIELD("Responsibility Center");
            UserSetup.TESTFIELD("Global Dimension 1 Code");
            RC.GET(UserSetup."Responsibility Center");
            RC.TESTFIELD("Issue Slip Nos.");
            NoSeriesMgt.InitSeries(RC."Issue Slip Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        END;
        "Posting Date" := WORKDATE;
        UserSetup_Rec.GET(USERID);
        "Shortcut Dimension 1 Code" := UserSetup_Rec."Global Dimension 1 Code";
        "Cost Center Code" := UserSetup_Rec."Responsibility Center";
    end;
}