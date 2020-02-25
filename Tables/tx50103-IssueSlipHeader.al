table 50103 "Issue Slip Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    UserSetup.GET(USERID);
                    UserSetup.TESTFIELD("Responsibility Center");
                    UserSetup.TESTFIELD("Global Dimension 1 Code");
                    RC.GET(UserSetup."Responsibility Center");
                    RC.TESTFIELD("Issue Slip Nos.");
                    NoSeriesMgt.TestManual(RC."Issue Slip Nos.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "From Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
            trigger OnValidate()
            var
            begin
                IssueSlipLine.RESET;
                IssueSlipLine.SETRANGE("Document No.", "No.");
                IF IssueSlipLine.FINDFIRST THEN
                    REPEAT
                        IssueSlipLine."From Location Code" := "From Location Code";
                        IssueSlipLine."To Location Code" := "Required Location Code";
                        IssueSlipLine.MODIFY;
                    UNTIL IssueSlipLine.NEXT = 0;
                Loc.Reset();
                IF Loc.GET("From Location Code") THEN
                    "From Location Name" := Loc.Name
                ELSE
                    "From Location Name" := '';
            end;

        }
        field(3; "Required Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
            trigger OnValidate()
            begin
                IssueSlipLine.RESET;
                IssueSlipLine.SETRANGE("Document No.", "No.");
                IF IssueSlipLine.FINDFIRST THEN
                    REPEAT
                        IssueSlipLine."From Location Code" := "From Location Code";
                        IssueSlipLine."To Location Code" := "Required Location Code";
                        IssueSlipLine.MODIFY;
                    UNTIL IssueSlipLine.NEXT = 0;

                Loc.Reset();
                IF Loc.GET("Required Location Code") THEN
                    "Required Location Name" := Loc.Name
                ELSE
                    "Required Location Name" := '';
            end;
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
            trigger OnValidate()
            begin
                IssueSlipvalidate.ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code", "Dimension Set ID");
            end;
        }
        field(10; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2), Blocked = CONST (false));
            trigger OnValidate()
            begin
                IssueSlipvalidate.ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code", "Dimension Set ID");
            end;
        }
        field(11; "Shortcut Dimension 3 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (3), Blocked = CONST (false));
            trigger OnValidate()
            begin
                IssueSlipvalidate.ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code", "Dimension Set ID");
            end;
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
        IssueSlipvalidate: Codeunit "Issue Slip validate";
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

    procedure AssistEdit1(OldRGPHeader: Record "Issue Slip Header"): Boolean
    begin
        UserSetup.GET(USERID);
        UserSetup.TESTFIELD("Responsibility Center");
        UserSetup.TESTFIELD("Global Dimension 1 Code");
        RC.GET(UserSetup."Responsibility Center");
        RC.TESTFIELD("Issue Slip Nos.");
        IF NoSeriesMgt.SelectSeries(RC."Issue Slip Nos.", OldRGPHeader."No. Series", "No. Series") THEN
            EXIT(TRUE);
    end;

    procedure GetNoSeriesCode(): Code[10]
    begin
        UserSetup.GET(USERID);
        UserSetup.TESTFIELD("Responsibility Center");
        UserSetup.TESTFIELD("Global Dimension 1 Code");
        RC.GET(UserSetup."Responsibility Center");
        RC.TESTFIELD("Issue Slip Nos.");
        EXIT(RC."Issue Slip Nos.");
    end;

    procedure TestNoSeries(): Boolean
    begin
        UserSetup.GET(USERID);
        UserSetup.TESTFIELD("Responsibility Center");
        UserSetup.TESTFIELD("Global Dimension 1 Code");
        RC.GET(UserSetup."Responsibility Center");
        RC.TESTFIELD("Issue Slip Nos.");
    end;

    procedure AssistEdit(IssueSlipHeader: Record "Issue Slip Header"): Boolean
    begin
        UserSetup.GET(USERID);
        UserSetup.TESTFIELD("Responsibility Center");
        UserSetup.TESTFIELD("Global Dimension 1 Code");
        RC.GET(UserSetup."Responsibility Center");
        RC.TESTFIELD("Issue Slip Nos.");

        TestNoSeries;
        IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, IssueSlipHeader."No. Series", "No. Series") THEN BEGIN
            TestNoSeries;
            NoSeriesMgt.SetSeries("No.");
            EXIT(TRUE);
        END;
    end;
}