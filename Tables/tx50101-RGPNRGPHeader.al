Table 50101 "RGP/NRGP Header"
{
    FIELDS
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",RGP,NRGP;
        }
        field(2; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Normal,Subcontracting;
        }
        field(3; "No."; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            BEGIN
                IF "No." <> xRec."No." THEN BEGIN
                    //UserSetup.GET(USERID);
                    //UserSetup.TESTFIELD("Responsibility Center");
                    //RC.GET(UserSetup."Responsibility Center");
                    // IF "Document Type"="Document Type"::RGP THEN BEGIN
                    //   IF Type = Type::Normal THEN
                    //     NoSeriesMgt.TestManual(RC."RGP Nos.")
                    //   ELSE IF Type = Type::Subcontracting THEN
                    //     NoSeriesMgt.TestManual(RC."Subcon RGP Nos.");
                    // END
                    // ELSE IF "Document Type" ="Document Type"::NRGP THEN BEGIN
                    //   IF Type = Type::Normal THEN
                    //     NoSeriesMgt.TestManual(RC."NRGP Nos.");
                    // END;
                    //"No. Series" := '';
                END;
            END;
        }
        field(4; "Party Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Customer,Vendor;
        }
        field(5; "Party No."; Code[20])
        {
            TableRelation = IF ("Party Type" = CONST (Customer)) Customer
            ELSE
            IF ("Party Type" = CONST (Vendor)) Vendor;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Customer: Record Customer;
                vendor: Record Vendor;
            BEGIN
                TESTFIELD("Party Type");
                CASE "Party Type" OF
                    "Party Type"::Customer:
                        BEGIN
                            Customer.GET("Party No.");
                            "Party Name" := Customer.Name;
                            "Party Address" := Customer.Address;
                            "Party Address 2" := Customer."Address 2";
                            "Party City" := Customer.City;
                            "Country/Region Code" := Customer."Country/Region Code";
                            //"State Code" := Customer."State Code";
                        END;
                    "Party Type"::Vendor:
                        BEGIN
                            Vendor.GET("Party No.");
                            "Party Name" := Vendor.Name;
                            "Party Address" := Vendor.Address;
                            "Party Address 2" := Vendor."Address 2";
                            "Party City" := Vendor.City;
                            "Country/Region Code" := Vendor."Country/Region Code";
                            //"State Code" := Vendor."State Code";
                        END;
                END;
            END;
        }
        field(6; "Party Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Party Address"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Party Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Party City"; Text[30])
        {
            TableRelation = IF ("Country/Region Code" = CONST ()) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Country/Region Code"; Code[10])
        {
            TableRelation = "Country/Region";
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "State Code"; Code[10])
        {
            //TableRelation=State;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "External Document No."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Responsibility; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16; Comment; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Expected Delivery Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Received Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "From Location"; Code[20])
        {
            TableRelation = Location;
            DataClassification = ToBeClassified;
        }
        field(20; "To Location"; Code[20])
        {
            TableRelation = Location;
            DataClassification = ToBeClassified;
        }
        field(21; Ship; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; Receive; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(24; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Ship,"Ship And Receive";
        }
        field(25; "NRGP Document Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Job Work Location"; Code[20])
        {
            TableRelation = Location;
            DataClassification = ToBeClassified;
        }
        field(27; "Posted Gate Entry No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Shortcut Dimension 1 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1),
                                                                  Blocked = CONST (false));
            DataClassification = ToBeClassified;
            trigger OnValidate()
            BEGIN
                //ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            END;
        }
        field(29; "Shortcut Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2),
                                                       Blocked = CONST (false));
            DataClassification = ToBeClassified;
            trigger OnValidate()
            BEGIN
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            END;
        }
        field(30; "Order Address Code"; Code[10])
        {
            TableRelation = "Order Address".Code WHERE ("Vendor No." = FIELD ("Party No."));
            DataClassification = ToBeClassified;
            trigger OnValidate()
            VAR
                Vendor: Record Vendor;
            BEGIN
            END;
        }
        field(31; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Posted Gate Entry Inward"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    KEYS
    {
        key(PrimaryKey; "Document Type", Type, "No.")
        {
            Clustered = true;
        }
    }
    VAR
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Customer: Record Customer;
        Vendor: Record Vendor;
        DimMgt: Codeunit DimensionManagement;
        RC: Record "Responsibility Center";
        UserSetup: Record "User Setup";

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            UserSetup.GET(USERID);
            UserSetup.TESTFIELD("Responsibility Center");
            RC.GET(UserSetup."Responsibility Center");
            IF "Document Type" = "Document Type"::RGP THEN BEGIN
                IF Type = Type::Normal THEN BEGIN
                    RC.TESTFIELD("RGP Nos.");
                    NoSeriesMgt.InitSeries(RC."RGP Nos.", xRec."No. Series", 0D, "No.", "No. Series");
                END ELSE
                    IF Type = Type::Subcontracting THEN BEGIN
                        RC.TESTFIELD("Subcon RGP Nos.");
                        NoSeriesMgt.InitSeries(RC."Subcon RGP Nos.", xRec."No. Series", 0D, "No.", "No. Series");
                    END;
            END ELSE
                IF "Document Type" = "Document Type"::NRGP THEN BEGIN
                    IF Type = Type::Normal THEN BEGIN
                        RC.TESTFIELD("NRGP Nos.");
                        NoSeriesMgt.InitSeries(RC."NRGP Nos.", xRec."No. Series", 0D, "No.", "No. Series");
                    END;
                END;
        END;
    end;

    PROCEDURE AssistEdit(OldRGPHeader: Record "RGP/NRGP Header"): Boolean;
    BEGIN
        UserSetup.GET(USERID);
        UserSetup.TESTFIELD("Responsibility Center");
        RC.GET(UserSetup."Responsibility Center");
        IF "Document Type" = "Document Type"::RGP THEN BEGIN
            IF Type = Type::Normal THEN BEGIN
                IF NoSeriesMgt.SelectSeries(RC."RGP Nos.", OldRGPHeader."No. Series", "No. Series") THEN
                    EXIT(TRUE);
            END ELSE
                IF Type = Type::Subcontracting THEN BEGIN
                    IF NoSeriesMgt.SelectSeries(RC."Subcon RGP Nos.", OldRGPHeader."No. Series", "No. Series") THEN
                        EXIT(TRUE);
                END;
        END ELSE
            IF "Document Type" = "Document Type"::NRGP THEN BEGIN
                IF Type = Type::Normal THEN BEGIN
                    IF NoSeriesMgt.SelectSeries(RC."NRGP Nos.", OldRGPHeader."No. Series", "No. Series") THEN
                        EXIT(TRUE);
                END;
            END;
    END;

    PROCEDURE PostRGPDocument(VAR ParaRGP: Record "RGP/NRGP Header");
    VAR
        ParaRGPLine: Record "RGP/NRGP Line";
        ItemJournalLine: Record "Item Journal Line";
        ReservationEntry: Record "Reservation Entry";
        TrackingSpecification: Record "Tracking Specification";
        c22: Codeunit "Item Jnl.-Post Line";
    BEGIN
        ParaRGPLine.RESET;
        ParaRGPLine.SETRANGE("Document No.", "No.");
        IF ParaRGPLine.FINDSET THEN BEGIN
            REPEAT
                ParaRGPLine.TESTFIELD("Posted Gate Entry No.");
                ItemJournalLine.INIT;
                ItemJournalLine."Journal Template Name" := 'RECLASS';
                ItemJournalLine."Journal Batch Name" := 'DEFAULT';
                ItemJournalLine."Line No." := GetLineNoIssue('RECLASS', 'DEFAULT');
                ItemJournalLine."Document No." := ParaRGP."No.";
                ItemJournalLine."Entry Type" := ItemJournalLine."Entry Type"::Transfer;
                ItemJournalLine.VALIDATE("Item No.", ParaRGPLine."No.");
                ItemJournalLine."Posting Date" := ParaRGP."Posting Date";
                ItemJournalLine.VALIDATE("Location Code", ParaRGP."From Location");
                ItemJournalLine.VALIDATE(Quantity, ParaRGPLine.Quantity);
                ItemJournalLine.VALIDATE("Unit of Measure Code", ParaRGPLine."Unit of Measure Code");
                ItemJournalLine.VALIDATE("New Location Code", ParaRGP."To Location");
                ItemJournalLine.VALIDATE("Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
                ItemJournalLine.VALIDATE("Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
                ItemJournalLine.VALIDATE("New Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
                ItemJournalLine.VALIDATE("New Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
                ReservationEntry.RESET;
                ReservationEntry.SETRANGE("Item No.", ParaRGPLine."No.");
                ReservationEntry.SETRANGE("Location Code", ParaRGP."From Location");
                ReservationEntry.SETRANGE("Source ID", ParaRGP."No.");
                ReservationEntry.SETRANGE("Source Batch Name", 'DEFAULT');
                ReservationEntry.SETRANGE("Source Ref. No.", ParaRGPLine."Line No.");
                IF ReservationEntry.FINDFIRST THEN REPEAT
                                                       ReservationEntry."Source ID" := 'RECLASS';
                                                       ReservationEntry."Source Ref. No." := ItemJournalLine."Line No.";
                                                       ReservationEntry.MODIFY;
                    UNTIL ReservationEntry.NEXT = 0;

                IF C22.RunWithCheck(ItemJournalLine) THEN BEGIN
                    ParaRGP.Status := ParaRGP.Status::Ship;
                    Ship := TRUE;
                END;
            UNTIL ParaRGPLine.NEXT = 0;
            MESSAGE('RGP Document %1 shipped from %2 location', ParaRGP."No.", ParaRGP."From Location");
        END;
    END;

    PROCEDURE GetLineNoIssue(ParaTemplate: Code[20]; ParaBatch: Code[20]): Integer;
    VAR
        ParaItemJnl: Record "Item Journal Line";
    BEGIN
        ParaItemJnl.RESET;
        ParaItemJnl.SETRANGE(ParaItemJnl."Journal Template Name", ParaTemplate);
        ParaItemJnl.SETRANGE(ParaItemJnl."Journal Batch Name", ParaBatch);
        IF ParaItemJnl.FINDLAST THEN
            EXIT(ParaItemJnl."Line No." + 10000)
        ELSE
            EXIT(10000);
    END;

    PROCEDURE PostRGPDocumentReceive(VAR ParaRGP: Record "RGP/NRGP Header");
    VAR
        ParaRGPLine: Record "RGP/NRGP Line";
        ItemJournalLine: Record "Item Journal Line";
        ReservationEntry: Record "Reservation Entry";
        TrackingSpecification: Record "Tracking Specification";
        C22: Codeunit "Item Jnl.-Post Line";
        T32: Record "Item Ledger Entry";
        ReservationEntryRec: Record "Reservation Entry";
        ParaRGPLine1: Record "RGP/NRGP Line";
        TotalQuantity: Decimal;
        TotalReceivedQty: Decimal;
        ParaRGPLine2: Record "RGP/NRGP Line";
        ParaRGPLine3: Record "RGP/NRGP Line";
    BEGIN
        ParaRGPLine3.RESET;
        ParaRGPLine3.SETRANGE("Document No.", "No.");
        ParaRGPLine3.SETFILTER("Qty. To Receive", '>%1', 0);
        IF NOT ParaRGPLine3.FINDSET THEN
            ERROR('Nothing to Post');

        ParaRGPLine.RESET;
        ParaRGPLine.SETRANGE("Document No.", "No.");
        ParaRGPLine.SETFILTER("Qty. To Receive", '>%1', 0);
        IF ParaRGPLine.FINDSET THEN BEGIN
            REPEAT
                ParaRGPLine.TESTFIELD("Posted Gate Entry No.");
                ParaRGPLine.TESTFIELD("Posted Gate Entry Inward");
                ItemJournalLine.INIT;
                ItemJournalLine."Journal Template Name" := 'RECLASS';
                ItemJournalLine."Journal Batch Name" := 'DEFAULT';
                ItemJournalLine."Line No." := GetLineNoIssue('RECLASS', 'DEFAULT');
                ItemJournalLine."Document No." := ParaRGP."No.";
                ItemJournalLine."Entry Type" := ItemJournalLine."Entry Type"::Transfer;
                ItemJournalLine.VALIDATE("Item No.", ParaRGPLine."No.");
                ItemJournalLine."Posting Date" := ParaRGP."Posting Date";
                ItemJournalLine.VALIDATE("Location Code", ParaRGP."To Location");
                ItemJournalLine.VALIDATE(Quantity, ParaRGPLine."Qty. To Receive");
                ItemJournalLine.VALIDATE("Unit of Measure Code", ParaRGPLine."Unit of Measure Code");
                ItemJournalLine.VALIDATE("New Location Code", ParaRGP."From Location");
                ItemJournalLine.VALIDATE("Shortcut Dimension 1 Code", ParaRGP."Shortcut Dimension 1 Code");
                ItemJournalLine.VALIDATE("Shortcut Dimension 2 Code", ParaRGP."Shortcut Dimension 2 Code");
                ItemJournalLine.VALIDATE("New Shortcut Dimension 1 Code", ParaRGP."Shortcut Dimension 1 Code");
                ItemJournalLine.VALIDATE("New Shortcut Dimension 2 Code", ParaRGP."Shortcut Dimension 2 Code");
                T32.RESET;
                T32.SETRANGE("Item No.", ParaRGPLine."No.");
                T32.SETRANGE("Entry Type", T32."Entry Type"::Transfer);
                T32.SETRANGE("Document No.", ParaRGP."No.");
                T32.SETRANGE("Location Code", ParaRGP."To Location");
                IF T32.FINDSET THEN REPEAT
                                        ReservationEntry.INIT;
                                        IF ReservationEntryRec.FINDLAST THEN
                                            ReservationEntry."Entry No." := ReservationEntryRec."Entry No." + 1;
                                        ReservationEntry."Item No." := ParaRGPLine."No.";
                                        ReservationEntry.VALIDATE("Location Code", ParaRGP."To Location");
                                        ReservationEntry."Qty. per Unit of Measure" := ParaRGPLine."Qty. per Unit of Measure";
                                        ReservationEntry.VALIDATE("Quantity (Base)", ParaRGPLine.Quantity * ParaRGPLine."Qty. per Unit of Measure" * -1);
                                        ReservationEntry."Reservation Status" := ReservationEntry."Reservation Status"::Prospect;
                                        ReservationEntry."Creation Date" := WORKDATE;
                                        ReservationEntry."Source Type" := 83;
                                        ReservationEntry."Source Subtype" := 4;

                                        ReservationEntry."Source ID" := 'RECLASS';

                                        ReservationEntry."Source Batch Name" := 'DEFAULT';
                                        ReservationEntry."Source Ref. No." := ItemJournalLine."Line No.";
                                        ReservationEntry."Created By" := USERID;
                                        ReservationEntry.Positive := FALSE;
                                        ReservationEntry."New Lot No." := T32."Lot No.";
                                        ReservationEntry."Lot No." := T32."Lot No.";

                                        ReservationEntry."Qty. to Handle (Base)" := ParaRGPLine.Quantity * ParaRGPLine."Qty. per Unit of Measure" * -1;
                                        ReservationEntry."Qty. to Invoice (Base)" := ParaRGPLine.Quantity * ParaRGPLine."Qty. per Unit of Measure" * -1;
                                        ReservationEntry.Quantity := ParaRGPLine.Quantity * ParaRGPLine."Qty. per Unit of Measure" * -1;

                                        ReservationEntry.INSERT;
                    UNTIL T32.NEXT = 0;

                IF C22.RunWithCheck(ItemJournalLine) THEN BEGIN
                    ParaRGPLine."Qty. Received" := ParaRGPLine."Qty. Received" + ParaRGPLine."Qty. To Receive";
                    ParaRGPLine."Qty. To Receive" := 0;
                    ParaRGPLine.MODIFY;

                END;
            UNTIL ParaRGPLine.NEXT = 0;

            CLEAR(TotalQuantity);
            CLEAR(TotalReceivedQty);

            ParaRGPLine1.RESET;
            ParaRGPLine1.SETRANGE("Document No.", "No.");
            IF ParaRGPLine1.FINDSET THEN REPEAT
                                             TotalQuantity += ParaRGPLine1.Quantity;
                                             TotalReceivedQty += ParaRGPLine1."Qty. Received";
                UNTIL ParaRGPLine1.NEXT = 0;

            IF TotalQuantity <> TotalReceivedQty THEN BEGIN
                ParaRGPLine2.RESET;
                ParaRGPLine2.SETRANGE("Document No.", "No.");
                IF ParaRGPLine2.FINDSET THEN REPEAT
                                                 ParaRGPLine2."Posted Gate Entry Inward" := '';
                                                 ParaRGPLine2.MODIFY;
                    UNTIL ParaRGPLine2.NEXT = 0;
            END;

            IF TotalQuantity = TotalReceivedQty THEN BEGIN
                ParaRGP.Status := ParaRGP.Status::"Ship And Receive";
                Receive := TRUE;
            END;

            MESSAGE('RGP Document %1 received at %2 location', ParaRGP."No.", ParaRGP."From Location");
        END;
    END;

    PROCEDURE PostNRGPDocument(VAR ParaRGP: Record "RGP/NRGP Header");
    VAR
        ParaRGPLine: Record "RGP/NRGP Line";
        ItemJournalLine: Record "Item Journal Line";
        ReservationEntry: Record "Reservation Entry";
        TrackingSpecification: Record "Tracking Specification";
        C22: Codeunit "Item Jnl.-Post Line";
    BEGIN
        ParaRGPLine.RESET;
        ParaRGPLine.SETRANGE("Document No.", "No.");
        IF ParaRGPLine.FINDSET THEN BEGIN
            REPEAT
                ParaRGPLine.TESTFIELD("Posted Gate Entry No.");
                ItemJournalLine.INIT;
                ItemJournalLine."Journal Template Name" := 'ITEM';
                ItemJournalLine."Journal Batch Name" := 'DEFAULT';
                ItemJournalLine."Line No." := GetLineNoIssue('ITEM', 'DEFAULT');
                ItemJournalLine."Document No." := ParaRGP."No.";
                ItemJournalLine."Entry Type" := ItemJournalLine."Entry Type"::"Negative Adjmt.";
                ItemJournalLine.VALIDATE("Item No.", ParaRGPLine."No.");
                ItemJournalLine."Posting Date" := ParaRGP."Posting Date";
                ItemJournalLine.VALIDATE("Location Code", ParaRGP."From Location");
                ItemJournalLine.VALIDATE(Quantity, ParaRGPLine.Quantity);
                ItemJournalLine.VALIDATE("Unit of Measure Code", ParaRGPLine."Unit of Measure Code");
                ItemJournalLine.VALIDATE("Shortcut Dimension 2 Code", ParaRGP."Shortcut Dimension 2 Code");
                ItemJournalLine.VALIDATE("Shortcut Dimension 1 Code", ParaRGP."Shortcut Dimension 1 Code");
                ReservationEntry.RESET;
                ReservationEntry.SETRANGE("Item No.", ParaRGPLine."No.");
                ReservationEntry.SETRANGE("Location Code", ParaRGP."From Location");
                ReservationEntry.SETRANGE("Source ID", ParaRGP."No.");
                ReservationEntry.SETRANGE("Source Batch Name", 'DEFAULT');
                ReservationEntry.SETRANGE("Source Ref. No.", ParaRGPLine."Line No.");
                IF ReservationEntry.FINDFIRST THEN REPEAT
                                                       ReservationEntry."Source ID" := 'ITEM';
                                                       ReservationEntry."Source Ref. No." := ItemJournalLine."Line No.";
                                                       ReservationEntry.MODIFY;
                    UNTIL ReservationEntry.NEXT = 0;

                IF C22.RunWithCheck(ItemJournalLine) THEN BEGIN
                    "NRGP Document Posted" := TRUE;

                END;
            UNTIL ParaRGPLine.NEXT = 0;
            MESSAGE('NRGP Document %1 Posted Successfully', ParaRGP."No.");
        END;
    END;

    PROCEDURE ValidateShortcutDimCode(FieldNumber: Integer; VAR ShortcutDimCode: Code[20]);
    VAR
        OldDimSetID: Integer;
    BEGIN
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        IF "No." <> '' THEN
            MODIFY;

        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
            MODIFY;
        END;
    END;
}

