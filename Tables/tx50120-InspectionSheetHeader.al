table 50120 "Inspection Sheet Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    PurchasesPayablesSetup.GET;
                    userset.GET(USERID);
                    NoSeriesMgt.TestManual(GetNoSeriesCode);
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Purchase Receipt","Production Output";
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Item Description"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Item No"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(7; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Refrence Doc. Number"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Refrence Doc. Line Number"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(10; "Total Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Unit of Measure"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(12; "User ID"; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Close;
        }
        field(14; "Acceptance Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(15; "Rejection Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location WHERE ("Reject Location" = FILTER (true));
        }
        field(16; "Accept Qty"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(17; "Reject Qty"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(18; "Overlook Result"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(19; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1), Blocked = CONST (false));

            trigger OnValidate()
            begin
                IssueSlipvalidate.ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code", "Dimension Set ID");
            end;
        }
        field(20; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2), Blocked = CONST (false));

            trigger OnValidate()
            begin
                IssueSlipvalidate.ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code", "Dimension Set ID");
            end;
        }
        field(21; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(22; "New Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1,' + Text007;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));

            trigger OnValidate()
            begin
                ValidateNewShortcutDimCode(1, "New Shortcut Dimension 1 Code");
            end;
        }
        field(23; "New Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,2,' + Text007;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));

            trigger OnValidate()
            begin
                ValidateNewShortcutDimCode(2, "New Shortcut Dimension 2 Code");
            end;
        }
        field(24; Posted; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(25; "Sample Qty"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(26; "Sample UOM"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(27; "Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnLookup()
            begin
                SelectBatchAccectLocation
            end;
        }
        field(28; "Batch Qty"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(29; "New Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(50101; "Actual Width"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50102; "Actual Thickness"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50103; "Actual Grade"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
        }
        field(50104; "Last QC Number"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
    }


    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        Text007: TextConst ENU = 'New';
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        USERMGT: Codeunit "User Setup Management";
        userset: Record "User Setup";
        //        PostingInspectionSheet: Codeunit "Posting Inspection Sheet";
        IssueSlipvalidate: Codeunit "Issue Slip validate";
        DimMgt: Codeunit DimensionManagement;

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            PurchasesPayablesSetup.GET;
            NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", 0D, "No.", "No. Series");
        END;
        "User ID" := USERID;
        ValidateNewShortcutDimCode(1, "New Shortcut Dimension 1 Code");
        ValidateNewShortcutDimCode(2, "New Shortcut Dimension 2 Code");
    end;

    local procedure ValidateNewShortcutDimCode(FieldNumber: Integer; VAR NewShortcutDimCode: Code[20])
    var
        myInt: Integer;
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, NewShortcutDimCode, "New Dimension Set ID");
    end;

    procedure GetNoSeriesCode(): Code[20]
    var
        myInt: Integer;
    begin
        PurchasesPayablesSetup.GET;
        PurchasesPayablesSetup.TESTFIELD(PurchasesPayablesSetup."QC Nos");
        EXIT(PurchasesPayablesSetup."QC Nos");
    end;

    local procedure SelectBatchAccectLocation()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        IF "Document Type" = "Document Type"::"Purchase Receipt" THEN BEGIN
            ItemLedgerEntry.RESET;
            ItemLedgerEntry.SETRANGE("Document No.", "Refrence Doc. Number");
            ItemLedgerEntry.SETRANGE("Document Line No.", "Refrence Doc. Line Number");
            ItemLedgerEntry.SETFILTER("Remaining Quantity", '<>%1', 0);
            IF PAGE.RUNMODAL(50052, ItemLedgerEntry) = ACTION::LookupOK THEN BEGIN
                ItemLedgerEntry.SETFILTER("Accept Batch", '%1', TRUE);
                "Batch No." := '';
                IF ItemLedgerEntry.FINDFIRST THEN
                    REPEAT
                        "Batch No." += ' ' + ItemLedgerEntry."Lot No.";
                    UNTIL ItemLedgerEntry.NEXT = 0;
            END;
        END;

        IF "Document Type" = "Document Type"::"Production Output" THEN BEGIN
            ItemLedgerEntry.RESET;
            ItemLedgerEntry.SETRANGE("Document No.", "Refrence Doc. Number");
            ItemLedgerEntry.SETRANGE("Order Line No.", "Refrence Doc. Line Number");
            ItemLedgerEntry.SETFILTER("Remaining Quantity", '<>%1', 0);
            IF PAGE.RUNMODAL(50052, ItemLedgerEntry) = ACTION::LookupOK THEN BEGIN
                ItemLedgerEntry.SETFILTER("Accept Batch", '%1', TRUE);
                "Batch No." := '';
                IF ItemLedgerEntry.FINDFIRST THEN
                    REPEAT
                        "Batch No." += ' ' + ItemLedgerEntry."Lot No.";
                    UNTIL ItemLedgerEntry.NEXT = 0;
            END;
        END;
    end;

    procedure AssistEdit(InspectionSheetHeader: Record "Inspection Sheet Header"): Boolean
    begin
        userset.GET(USERID);

        PurchasesPayablesSetup.GET;
        TestNoSeries;
        IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, InspectionSheetHeader."No. Series", "No. Series") THEN BEGIN
            TestNoSeries;
            NoSeriesMgt.SetSeries("No.");
            EXIT(TRUE);
        END;
    end;

    procedure TestNoSeries(): Boolean
    begin
        PurchasesPayablesSetup.TESTFIELD(PurchasesPayablesSetup."QC Nos");
    end;
}