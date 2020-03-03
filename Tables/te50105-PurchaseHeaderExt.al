tableextension 50105 PurchaseHeaderExt extends "Purchase Header"
{
    fields
    {
        field(50100; "Order Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",RM,Consumable,Service,Import,"Capital Order";
            trigger OnValidate()
            begin
                IF (xRec."Order Type" <> xRec."Order Type"::" ") THEN
                    ERROR('Order Type can not be changed');
                InitInsert;
            end;
        }
        field(50101; "Inco terms"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",EX,FOR,CIF,FOB;
        }
        field(50102; Transporter; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Posted Gate Entry No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Shortcut Dimension 8 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
        field(50106; Project; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Total Qty. to Send"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Company Location"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50109; "Vendor Location"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "One Send Multi Receive"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Send Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Lot No"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnLookup()
            var
                myInt: Integer;
            begin
                SelectBatch;
            end;
        }
        field(50113; "INR Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50114; "Delivery Date"; DateFormula)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                PurLine_Rec: Record "Purchase Line";
            begin
                PurLine_Rec.RESET;
                PurLine_Rec.SETRANGE(PurLine_Rec."Document No.", "No.");
                PurLine_Rec.SETFILTER("No.", '<>%1', '');
                IF PurLine_Rec.FINDFIRST THEN BEGIN
                    REPEAT
                        PurLine_Rec."Requested Receipt Date" := CALCDATE("Delivery Date", "Order Date");
                        PurLine_Rec.VALIDATE(PurLine_Rec."Requested Receipt Date");
                        PurLine_Rec."Promised Receipt Date" := CALCDATE("Delivery Date", "Order Date");
                        PurLine_Rec.VALIDATE(PurLine_Rec."Promised Receipt Date");
                        PurLine_Rec.MODIFY;
                    UNTIL PurLine_Rec.NEXT = 0;
                END;
            end;
        }
        field(50115; "Copy Document"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50116; "Last Modify By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50117; "Re-Open Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50118; "Re-Open By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50119; Subcontracting; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50120; Trading; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
                PurchRecSetup: Record "Purchases & Payables Setup";
                PurchSetup: Record "Responsibility Center";
                PurchLine2: Record "Purchase Line";
                Text16500: TextConst ENU = 'Trading can not be true when Excise Loading On Inventory on lines has been checked.';
            begin
                TESTFIELD(Status, Status::Open);
                UserSetup.GET(USERID);
                UserSetup.TESTFIELD("Responsibility Center");
                PurchSetup.GET(UserSetup."Responsibility Center");
                PurchRecSetup.GET;
                InitRecord;
                PurchLine2.RESET;
                PurchLine2.SETRANGE("Document Type", "Document Type");
                PurchLine2.SETRANGE("Document No.", "No.");
                PurchLine2.SETRANGE("Excise Loading on Inventory", TRUE);
                IF PurchLine2.FINDFIRST THEN
                    ERROR(Text16500);
            end;
        }
    }

    var
        myInt: Integer;

    local procedure SelectBatch()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        EntrySummary: Record "Entry Summary";
    begin
        IF Subcontracting THEN BEGIN
            ItemLedgerEntry.RESET;
            ItemLedgerEntry.FILTERGROUP(2);
            ItemLedgerEntry.SETFILTER("Remaining Quantity", '>%1', 0);
            ItemLedgerEntry.SETRANGE("Item No.", "Send Item No.");
            ItemLedgerEntry.SETRANGE("Location Code", "Company Location");
            ItemLedgerEntry.SETFILTER("Subcontracting Batch Select", '%1', FALSE);
            ItemLedgerEntry.FILTERGROUP(0);
            IF PAGE.RUNMODAL(50052, ItemLedgerEntry) = ACTION::LookupOK THEN BEGIN
                ItemLedgerEntry.SETFILTER("Accept Batch", '%1', TRUE);
                "Lot No" := '';
                IF ItemLedgerEntry.FINDFIRST THEN
                    REPEAT
                        "Lot No" += ' ' + ItemLedgerEntry."Lot No.";
                    UNTIL ItemLedgerEntry.NEXT = 0;
            END;
        END;
    end;

    local procedure InitInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CompanyInfo: Record "Company Information";
    begin
        IF "No." = '' THEN BEGIN
            IF ("Document Type" = "Document Type"::Order) OR ("Document Type" = "Document Type"::"Blanket Order") THEN
                IF NOT Subcontracting THEN
                    TESTFIELD("Order Type");
            TestNoSeries;
            NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", "Posting Date", "No.", "No. Series");
        END;
        CompanyInfo.GET;
        Trading := CompanyInfo."Trading Co.";
        InitRecord;
    end;
}