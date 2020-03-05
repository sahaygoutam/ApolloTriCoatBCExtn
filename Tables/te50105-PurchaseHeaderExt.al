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
        NameAddressDetails: Text[512];
        DropShptNameAddressDetails: Text[512];
        SpecOrderNameAddressDetails: Text[512];
        CompanyInfo: Record "Company Information";

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

    local procedure SkipInitialization(): Boolean
    begin
        IF "No." = '' THEN
            EXIT(FALSE);

        IF "Buy-from Vendor No." = '' THEN
            EXIT(FALSE);

        IF xRec."Document Type" <> "Document Type" THEN
            EXIT(FALSE);

        IF GETFILTER("Buy-from Vendor No.") <> '' THEN
            IF GETRANGEMIN("Buy-from Vendor No.") = GETRANGEMAX("Buy-from Vendor No.") THEN
                IF "Buy-from Vendor No." = GETRANGEMIN("Buy-from Vendor No.") THEN
                    EXIT(FALSE);

        EXIT(TRUE);
    end;

    procedure CheckDropShptAddressDetails(SalesHeader: Record "Sales Header"): Boolean
    var
        myInt: Integer;
    begin
        NameAddressDetails := DropShptNameAddressDetails;
        DropShptNameAddressDetails :=
          SalesHeader."Ship-to Name" + SalesHeader."Ship-to Name 2" +
          SalesHeader."Ship-to Address" + SalesHeader."Ship-to Address 2" +
          SalesHeader."Ship-to Post Code" + SalesHeader."Ship-to City" +
          SalesHeader."Ship-to Contact";
        IF NameAddressDetails = '' THEN
            NameAddressDetails := DropShptNameAddressDetails;

    end;

    procedure CheckSpecOrderAddressDetails(SalesHeader: Record "Sales Header"): Boolean
    var
        LocationCode: Record Location;
    begin
        NameAddressDetails := SpecOrderNameAddressDetails;
        IF LocationCode.GET(SalesHeader."Location Code") THEN
            SpecOrderNameAddressDetails :=
              LocationCode.Name + LocationCode."Name 2" +
              LocationCode.Address + LocationCode."Address 2" +
              LocationCode."Post Code" + LocationCode.City +
              LocationCode.Contact
        ELSE BEGIN
            CompanyInfo.GET;
            SpecOrderNameAddressDetails :=
              CompanyInfo."Ship-to Name" + CompanyInfo."Ship-to Name 2" +
              CompanyInfo."Ship-to Address" + CompanyInfo."Ship-to Address 2" +
              CompanyInfo."Ship-to Post Code" + CompanyInfo."Ship-to City" +
              CompanyInfo."Ship-to Contact";
        END;
        IF NameAddressDetails = '' THEN
            NameAddressDetails := SpecOrderNameAddressDetails;
        EXIT(NameAddressDetails = SpecOrderNameAddressDetails);
    end;

    local procedure InitRecOnVendUpdate()
    begin
        IF NOT SkipInitialization THEN
            InitInsert;
    end;

    procedure ShortClose(var PeraPH: Record "Purchase Header")
    var
        PurchaseLine: Record "Purchase Line";
        T39_Loc: Record "Purchase Line";
        TextPartial: TextConst ENU = 'Document Short Closed, If require create new order for remaining Qty.';
        Answer: Boolean;
    begin
        PurchaseLine.RESET;
        PurchaseLine.SETRANGE("Document No.", PeraPH."No.");
        Answer := DIALOG.CONFIRM('Do You Want to Close Order No. %1', FALSE, PeraPH."No.");

        IF Answer THEN BEGIN
            // PeraPH.Status := PeraPH.Status::"Short Close";
            // PeraPH.MODIFY;
            T39_Loc.RESET;
            T39_Loc.SETRANGE("Document No.", PeraPH."No.");
            IF T39_Loc.FINDFIRST THEN
                REPEAT
                    T39_Loc."Short Closed" := TRUE;
                    T39_Loc.MODIFY;
                UNTIL T39_Loc.NEXT = 0;
            MESSAGE(TextPartial);
        END;
    end;
}