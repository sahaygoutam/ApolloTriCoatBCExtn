table 50105 "Indent Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Indent No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "Indent No." <> xRec."Indent No." THEN BEGIN
                    UserSetup.GET(USERID);
                    UserSetup.TESTFIELD("Responsibility Center");
                    NoSeriesMgt.TestManual(GetNoSeriesCode);
                    "No. Series" := '';
                    "Indent Date" := WORKDATE;
                END;
            end;
        }
        field(2; "Indent Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IndentLineRec.RESET;
                IndentLineRec.SETRANGE("Document No.", "Indent No.");
                IF IndentLineRec.FINDSET THEN
                    REPEAT
                        IndentLineRec."Indent Date" := "Indent Date";
                        IndentLineRec.MODIFY;
                    UNTIL IndentLineRec.NEXT = 0;
            end;
        }
        field(3; "Project No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Approved,Rejected;
        }
        field(5; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IndentLineRec.RESET;
                IndentLineRec.SETRANGE("Document No.", "Indent No.");
                IF IndentLineRec.FINDSET THEN
                    REPEAT
                        IndentLineRec."User ID" := "User ID";
                        IndentLineRec.MODIFY;
                    UNTIL IndentLineRec.NEXT = 0;
            end;
        }
        field(11; "Indent Created from Planning"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "No. of PO"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Remarks; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Indent Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Closed;
        }
        field(15; "Sales Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(17; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Approved,Closed,"Pending Approval",Issued;
        }
        field(18; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(19; "From Location"; Code[10])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IndentLineRec1.RESET;
                IndentLineRec1.SETRANGE("Document No.", "Indent No.");
                IF IndentLineRec1.FINDFIRST THEN
                    REPEAT
                        IndentLineRec1."From Location" := "Required Location";
                        IndentLineRec1.MODIFY;
                    UNTIL IndentLineRec1.NEXT = 0;
            end;
        }
        field(20; "Requested Delivery Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Shortcut Dimension 3 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 3 Code");
            end;
        }
        field(22; "Released Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Released,Cancel,Close,"Pending Approval";
            trigger OnValidate()
            begin
                IndentLineRec.RESET;
                IndentLineRec.SETRANGE("Document No.", "Indent No.");
                IF IndentLineRec.FINDSET THEN
                    REPEAT
                        IndentLineRec."Released Status" := "Released Status";
                        IndentLineRec.MODIFY;
                    UNTIL IndentLineRec.NEXT = 0;
            end;
        }
        field(23; "User Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IndentLineRec.RESET;
                IndentLineRec.SETRANGE("Document No.", "Indent No.");
                IF IndentLineRec.FINDSET THEN
                    REPEAT
                        IndentLineRec."User Name" := "User Name";
                        IndentLineRec.MODIFY;
                    UNTIL IndentLineRec.NEXT = 0;
            end;
        }
        field(24; "Completely Received"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Required Location"; Code[10])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IndentLineRec1.RESET;
                IndentLineRec1.SETRANGE("Document No.", "Indent No.");
                IF IndentLineRec1.FINDFIRST THEN
                    REPEAT
                        IndentLineRec1.Location := "Required Location";
                        IndentLineRec1.MODIFY;
                    UNTIL IndentLineRec1.NEXT = 0;
                Location.GET("Required Location");
                "Required Location Name" := Location.Name;
            end;
        }
        field(27; "Assigned User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Approval User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Required Location Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Date-Time Sent for Approval"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Last Date-Time Modified"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }


    keys
    {
        key(PK; "Indent No.")
        {
            Clustered = true;
        }
    }

    var
        GeneralLedgerSetup: Record "Responsibility Center";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        IndentLineRec: Record "Indent Line";
        userset: Record "User Setup";
        USERMGT: Codeunit "User Setup Management";
        DimMgt: Codeunit DimensionManagement;
        RespCntr: Record "Responsibility Center";
        IndentLineRec1: Record "Indent Line";
        Cu22: Codeunit "Item Jnl.-Post Line";
        Location: Record Location;
        IsApprovalFlag: Boolean;
        UserSetup: Record "User Setup";
        Text002: TextConst ENU = 'Do you want to release the Indent?';
        Text003: TextConst ENU = 'Do you want to cancel the Indent?';
        Text004: TextConst ENU = 'Indent can not be cancel as it is in process';
        Text005: TextConst ENU = 'Do you want to close the Indent?';
        Text006: TextConst ENU = 'Do you want to reopen the Indent?';

    trigger OnInsert()
    begin
        IF "Indent No." = '' THEN BEGIN
            userset.GET(USERID);
            userset.TESTFIELD("Responsibility Center");
            GeneralLedgerSetup.GET(userset."Responsibility Center");
            NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", 0D, "Indent No.", GeneralLedgerSetup."Indent No. Series");
        END;
        "User ID" := USERID;
    end;

    procedure GetNoSeriesCode(): code[10]
    begin
        userset.GET(USERID);
        userset.TESTFIELD("Responsibility Center");
        GeneralLedgerSetup.GET(userset."Responsibility Center");
        GeneralLedgerSetup.TESTFIELD(GeneralLedgerSetup."Indent No. Series");
        EXIT(GeneralLedgerSetup."Indent No. Series");
    end;

    procedure TestNoSeries(): Boolean
    begin
        GeneralLedgerSetup.TESTFIELD(GeneralLedgerSetup."Indent No. Series");
    end;

    procedure AssistEdit(OldIndentHeader: Record "Indent Header"): Boolean
    begin
        userset.GET(USERID);
        userset.GET(USERID);
        userset.TESTFIELD("Responsibility Center");
        GeneralLedgerSetup.GET(userset."Responsibility Center");
        TestNoSeries;
        IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, OldIndentHeader."No. Series", "No. Series") THEN BEGIN
            TestNoSeries;
            NoSeriesMgt.SetSeries("Indent No.");
            EXIT(TRUE);
        END;
    end;

    LOCAL procedure ValidateShortcutDimCode(FieldNumber: Integer; VAR ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        IF "Indent No." <> '' THEN
            MODIFY;

        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
            MODIFY;
        END;
    end;

    procedure ReleaseIndent()
    var
        IndentLine: Record "Indent Line";
    begin
        IF NOT IsApprovalFlag THEN BEGIN
            IF NOT CONFIRM(Text002, FALSE) THEN
                EXIT;
        END;
        TESTFIELD("User ID");
        LOCKTABLE;
        IndentLine.RESET;
        IndentLine.SETRANGE("Document No.", "Indent No.");
        IF IndentLine.FINDSET THEN
            REPEAT
                IF IndentLine.Type <> IndentLine.Type::" " THEN BEGIN
                    IndentLine.TESTFIELD(IndentLine."No.");
                    IndentLine.TESTFIELD(IndentLine.Quantity);
                END;
            UNTIL IndentLine.NEXT = 0;
        VALIDATE("Released Status", "Released Status"::Released);
    end;

    procedure SetFromApprovalFlag(ApprovalFlag: Boolean)
    begin
        IsApprovalFlag := ApprovalFlag;
    end;

    procedure CancelIndent()
    begin
        IF "Released Status" = "Released Status"::Cancel THEN BEGIN
            MESSAGE('Status is Already in Cancel');
            EXIT;
        END;
        IF NOT ("Released Status" = "Released Status"::Open) THEN BEGIN
            MESSAGE('Status Must be Open to Cancel/Close');
            EXIT;
        END;
        IF NOT CONFIRM(Text003, FALSE) THEN
            EXIT;
    end;

    procedure CloseIndent()
    var
        IndentLine: Record "Indent Line";
    begin
        IF "Released Status" = "Released Status"::Close THEN BEGIN
            MESSAGE('Status is Already in Closed');
            EXIT;
        END;
        IF NOT ("Released Status" = "Released Status"::Open) THEN BEGIN
            MESSAGE('Status Must be open to Cancel/Close');
            EXIT;
        END;

        IF NOT CONFIRM(Text005, FALSE) THEN
            EXIT;
        LOCKTABLE;
        IndentLine.SETRANGE("Document No.", "Indent No.");
        VALIDATE("Released Status", "Released Status"::Close);
    end;

    procedure ReopenIndent()
    var
        IndentLine: Record "Indent Line";
        Text000: TextConst ENU = 'Indent Status must be Indent in the Indent Lines';
        Text007: TextConst ENU = 'Can not Reopen the indent if status is Cancel/Closed.';
    begin
        IF NOT IsApprovalFlag THEN BEGIN
            IF NOT CONFIRM(Text006, FALSE) THEN
                EXIT;
            IF "Released Status" <> "Released Status"::Released THEN
                EXIT;
        END;

        IndentLine.RESET;
        IndentLine.SETRANGE("Document No.", "Indent No.");

        IF IndentLine.FIND('-') THEN BEGIN
            VALIDATE("Released Status", "Released Status"::Open);
        END ELSE
            MESSAGE(Text000);
    end;
}