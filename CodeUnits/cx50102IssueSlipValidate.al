Codeunit 50102 "Issue Slip validate"
{
    VAR
        InvtSetup: Record "Inventory Setup";
        UserSetup: Record "User Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Loc: Record Location;
        LocFlow: Record "Issue Slip Line";
        DimMgt: Codeunit DimensionManagement;
        Item: Record Item;
        Vendor: Record Vendor;
        //IndentLine:	Record	"Indent Line";
        LeadTime: DateFormula;
        "Purchase Period": DateFormula;
        "Safety Stock Period": DateFormula;
        "Lead Time": DateFormula;

    PROCEDURE PostRGPDocument(VAR ParaRGP: Record "Issue Slip Header")
    var
    begin

    end;


    PROCEDURE GetLineNoIssue(ParaTemplate: Code[20]; ParaBatch: Code[20]): Integer
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

    PROCEDURE PostRGPDocumentReceive(VAR ParaRGP: Record "Issue Slip Header")
    VAR
    BEGIN

    END;

    PROCEDURE ValidateShortcutDimCode(FieldNumber: Integer; VAR ShortcutDimCode: Code[20]; VAR DimensionSetID: Integer)
    BEGIN
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, DimensionSetID);
    END;

    PROCEDURE ShowDimensions(PeraISH: Record "Issue Slip Header");
    VAR
        DimMgt: Codeunit DimensionManagement;
    BEGIN
        PeraISH."Dimension Set ID" :=
        DimMgt.EditDimensionSet2(
        PeraISH."Dimension Set ID", STRSUBSTNO('%1 %2 %3', '', '', 10000),
        PeraISH."Shortcut Dimension 1 Code", PeraISH."Shortcut Dimension 2 Code");
    END;

    PROCEDURE AssignLotlNumber(PeraIssueSlipLine: Record "Issue Slip Line");
    VAR
        IssueSlipLine_Rec: Record "Issue Slip Line";
    BEGIN
        PeraIssueSlipLine.TESTFIELD("Item No.");
        PeraIssueSlipLine.TESTFIELD("Required Quantity");
        PeraIssueSlipLine.TESTFIELD("Posting Date");
        PeraIssueSlipLine.TESTFIELD("From Location Code");
        PeraIssueSlipLine.CallItemTracking(PeraIssueSlipLine);
    END;

    PROCEDURE CallItemTracking(VAR RecRGPLine: Record "Issue Slip Line");
    VAR
        TrackingSpecification: Record "Tracking Specification";
        ItemTrackingPage: Page "Item Tracking Lines";
        ItemJnlLine: Record "Item Journal Line";
    BEGIN
        ItemTracking(RecRGPLine, TrackingSpecification);
        ItemTrackingPage.SetFormRunMode(1);
        ItemTrackingPage.SetSourceSpec(TrackingSpecification, RecRGPLine."Posting Date");
        ItemTrackingPage.SetInbound(ItemJnlLine.IsInbound);
        ItemTrackingPage.RUNMODAL;
    END;

    PROCEDURE ItemTracking(VAR LocRGPLine: Record "Issue Slip Line"; VAR TrackingSpecification: Record "Tracking Specification");
    VAR
        InvSetup: Record "Manufacturing Setup";
    BEGIN
    END;

    // PROCEDURE CalculateStockInv(PeraIndentLine : Record 50006);
    // VAR
    //   IndentHeader@1000000002 : Record 50005;
    //   ILE@1000000001 : Record 32;
    // BEGIN
    //   //PRU-VR1.00
    //   PeraIndentLine."Stock In Hand":=0;
    //   IF (PeraIndentLine."No." <> '') THEN BEGIN
    //     Item.RESET;
    //     Item.SETRANGE("No.",PeraIndentLine."No.");
    //     IF Item.FINDFIRST THEN
    //     IF PeraIndentLine.Location <> '' THEN
    //       IndentHeader.RESET;
    //       IndentHeader.SETRANGE("Indent No.",PeraIndentLine."Document No.");
    //       IF IndentHeader.FINDFIRST THEN
    //           ILE.RESET;
    //           ILE.SETRANGE("Item No.",Item."No.");
    //           ILE.SETRANGE("Location Code",PeraIndentLine.Location); //RK-PRU
    //           IF ILE.FINDSET THEN BEGIN
    //             REPEAT
    //             PeraIndentLine."Stock In Hand" += ILE.Quantity;
    //             UNTIL ILE.NEXT =0;
    //           END;
    //   END;
    //   //PRU-VR1.00
    // END;

    // PROCEDURE CloseIndent@1000000005(PeraIH@1000000000 : Record 50005);
    // VAR
    //   IndentLine@1000000001 : Record 50006;
    //   IndentLine1@1000000002 : Record 50006;
    // BEGIN
    //   IF PeraIH."Released Status"=PeraIH."Released Status"::Close THEN
    //     ERROR('Document is already closed');
    //   IndentLine.RESET;
    //   IndentLine.SETRANGE("Document No.",PeraIH."Indent No.");
    //   IF IndentLine.FINDFIRST THEN BEGIN
    //     IndentLine1.RESET;
    //     IndentLine1.SETRANGE("Document No.",PeraIH."Indent No.");
    //     IndentLine1.FINDSET;
    //     IndentLine1.MODIFYALL("Released Status",IndentLine1."Released Status"::Close);
    //     PeraIH."Released Status" := PeraIH."Released Status"::Close;
    //     PeraIH.MODIFY;
    //   END;
    // END;

    // PROCEDURE "Re-OpenIndent"@1000000006(PeraIH@1000000000 : Record 50005);
    // VAR
    //   Text50000@1000000001 : TextConst 'ENU=Do you want to Re-open the Indent';
    //   IndentLine1@1000000002 : Record 50006;
    // BEGIN
    //   PeraIH.TESTFIELD("Approval Status",PeraIH."Approval Status"::Approved);
    //   UserSetup.GET(USERID);
    //     BEGIN
    //       IF CONFIRM(Text50000,FALSE,PeraIH."Indent No.") THEN
    //         BEGIN
    //           IndentLine1.RESET;
    //           IndentLine1.SETRANGE("Document No.",PeraIH."Indent No.");
    //           IndentLine1.SETRANGE("Approval Status",IndentLine1."Approval Status"::Approved);
    //           IF IndentLine1.FINDSET(TRUE,FALSE) THEN BEGIN
    //             IndentLine1.MODIFYALL("Approval Status",IndentLine1."Approval Status"::Open);
    //             PeraIH."Approval Status" :=PeraIH."Approval Status"::Open;
    //             PeraIH.MODIFY;
    //           END;
    //         END;
    //    END;
    // END;

    // PROCEDURE ApproveIndentLines@1000000007(PeraIH@1000000006 : Record 50005);
    // VAR
    //   IndentLine_Loc@1000000000 : Record 50006;
    //   RecLocation@1000000005 : Record 14;
    //   TotalRemainingQty@1000000004 : Decimal;
    //   IndentLineQty@1000000003 : Decimal;
    //   TotalRemainingQty1@1000000002 : Decimal;
    //   ILE@1000000001 : Record 32;
    //   IndentLine@1000000007 : Record 50006;
    //   Text50004@1000000008 : TextConst 'ENU=You do not have permission to approve the Indent line.';
    // BEGIN
    //   CLEAR(TotalRemainingQty);
    //   CLEAR(IndentLineQty);
    //   CLEAR(TotalRemainingQty1);

    //   IndentLine.RESET;
    //   IndentLine.SETRANGE("Document No.",PeraIH."Indent No.");
    //   //IndentLine.SETFILTER("Chicks Item",'%1',TRUE);
    //   IF IndentLine.FINDFIRST THEN
    //     REPEAT
    //      IndentLineQty+=IndentLine.Quantity;
    //     UNTIL IndentLine.NEXT=0;

    //   ILE.RESET;
    //   ILE.SETRANGE("Location Code",PeraIH."Required Location");
    //   ILE.SETRANGE("Item No.",IndentLine."No.");
    //   ILE.SETFILTER("Remaining Quantity",'>%1',0);
    //   IF ILE.FINDSET THEN BEGIN
    //   ILE.CALCSUMS("Remaining Quantity");
    //     TotalRemainingQty := ILE."Remaining Quantity";
    //   //TotalRemainingQty:=RecLocation.Capicity-ILE."Remaining Quantity"; Pru_gk
    //   //IF RecLocation.Capicity>0 THEN  ///Pru_gk
    //     IF TotalRemainingQty < IndentLineQty THEN
    //       ERROR('Qty must not be greater than %1',TotalRemainingQty);
    //   END;
    //   //-RK-PRU

    //   IF UserSetup.GET(USERID) THEN;
    //   //PeraIH.TESTFIELD("Required Location");
    //   IF PeraIH."Approval Status" =PeraIH."Approval Status"::Closed THEN
    //     ERROR('Approval Status must be open');
    //   IF NOT UserSetup."Allow Indent Line Approval" THEN
    //     ERROR(Text50004);
    //   IF UserSetup."Allow Indent Line Approval" THEN BEGIN
    //     IndentLine_Loc.RESET;
    //     IndentLine_Loc.SETRANGE("Document No.",PeraIH."Indent No.");
    //     //IndentLine_Loc.SETRANGE("Approval Status",IndentLine_Loc."Approval Status"::Open);
    //     IndentLine_Loc.SETFILTER("Approval Status",'%1|%2',IndentLine_Loc."Approval Status"::Open,IndentLine_Loc."Approval Status"::"Pending Approval");
    //     IF IndentLine_Loc.FINDFIRST THEN
    //     REPEAT
    //       IndentLine_Loc.TESTFIELD(Quantity);
    //     UNTIL IndentLine_Loc.NEXT=0;
    //     IndentLine_Loc.RESET;
    //     IndentLine_Loc.SETRANGE("Document No.",PeraIH."Indent No.");
    //     //IndentLine_Loc.SETRANGE("Approval Status",IndentLine_Loc."Approval Status"::Open);
    //     IndentLine_Loc.SETFILTER("Approval Status",'%1|%2',IndentLine_Loc."Approval Status"::Open,IndentLine_Loc."Approval Status"::"Pending Approval");
    //     IF IndentLine_Loc.FINDFIRST THEN BEGIN
    //     REPEAT
    //       IndentLine_Loc."Approval Status":=IndentLine_Loc."Approval Status"::Approved;
    //       IndentLine_Loc."Approval User ID" := USERID;
    //       IndentLine_Loc."Approved Date" := WORKDATE;
    //       IndentLine_Loc.MODIFY;
    //     UNTIL IndentLine_Loc.NEXT=0;
    //       PeraIH."Approval Status" := PeraIH."Approval Status"::Approved;
    //       PeraIH."Approval User ID" := USERID;
    //       PeraIH.MODIFY;
    //     END;
    //   END;
    // END;

    // PROCEDURE SendApprovalRequest@1000000008(PeraIH@1000000000 : Record 50005);
    // VAR
    //   RecordLink@1000000002 : Record 2000000068;
    //   T83@1000000001 : Record 83;
    //   IndentHeader@1000000003 : Record 50005;
    //   IndentLine@1000000004 : Record 50006;
    // BEGIN
    //   UserSetup.GET(USERID);

    //   IF NOT UserSetup."Allow Indent Line Approval" THEN BEGIN
    //     PeraIH.TESTFIELD("Assigned User ID");
    //     RecordLink.INIT;
    //     RecordLink."Link ID" := GetLastLinkNo;
    //     IndentHeader.GET(PeraIH."Indent No.");
    //     RecordLink.URL1 := GETURL(CURRENTCLIENTTYPE,COMPANYNAME,OBJECTTYPE::Page,50004,IndentHeader);
    //     RecordLink.Description := 'Indent Order - '+ PeraIH."Indent No.";
    //     RecordLink.Type := RecordLink.Type::Note;
    //     RecordLink.Created := CURRENTDATETIME;
    //     RecordLink."User ID" := USERID;
    //     RecordLink.Company := COMPANYNAME;
    //     RecordLink.Notify := TRUE;
    //     RecordLink."To User ID" := PeraIH."Assigned User ID";
    //     RecordLink.INSERT;
    //     PeraIH."Approval Status" := PeraIH."Approval Status"::"Pending Approval";
    //     IndentLine.RESET;
    //     IndentLine.SETRANGE("Document No.",PeraIH."Indent No.");
    //     IF IndentLine.FINDFIRST THEN BEGIN
    //       //IndentLine."Approval Status" := IndentLine."Approval Status"::"Pending Approval";
    //       IndentLine.MODIFYALL(IndentLine."Approval Status",IndentLine."Approval Status"::"Pending Approval");
    //     END;
    //     //CurrPage.SAVERECORD;
    //   END;
    //   IF UserSetup."Allow Indent Line Approval" THEN BEGIN
    //     PeraIH."Approval Status" := PeraIH."Approval Status"::Approved;
    //     IndentLine.RESET;
    //     IndentLine.SETRANGE("Document No.",PeraIH."Indent No.");
    //     IF IndentLine.FINDFIRST THEN BEGIN
    //       //IndentLine."Approval Status" := IndentLine."Approval Status"::"Pending Approval";
    //       IndentLine.MODIFYALL(IndentLine."Approval Status",IndentLine."Approval Status"::Approved);
    //     END;
    //     //CurrPage.SAVERECORD;
    //   END;
    // END;

    LOCAL PROCEDURE GetLastLinkNo(): Integer;
    VAR
        RL: Record "Record Link";
    BEGIN
        RL.RESET;
        IF RL.FINDLAST THEN
            EXIT(RL."Link ID" + 1)
        ELSE
            EXIT(1);
    END;

    // PROCEDURE IssueIndent@1000000009(PeraIH@1000000000 : Record 50005);
    // VAR
    //   IssueSlipvalidate@1000000001 : Codeunit 50002;
    // BEGIN
    //   IF PeraIH."Approval Status"=PeraIH."Approval Status"::Issued THEN
    //     ERROR('Document is already Issued');
    //   IndentLine.RESET;
    //   IndentLine.SETRANGE("Document No.",PeraIH."Indent No.");
    //   IF IndentLine.FINDFIRST THEN BEGIN REPEAT
    //     PeraIH.TESTFIELD("From Location");
    //     PeraIH.TESTFIELD("Required Location");
    //     PostItemReclassJnl(IndentLine);
    //     IndentLine."Approval Status" := IndentLine."Approval Status"::Issued;
    //     IndentLine.MODIFY;
    //   UNTIL IndentLine.NEXT=0;
    //     PeraIH."Approval Status" := PeraIH."Approval Status"::Issued;
    //    // CurrPage.SAVERECORD;
    //   END;
    // END;

    // PROCEDURE PostItemReclassJnl@1000000013(VAR IndentLineLoc@1000000000 : Record 50006);
    // VAR
    //   ItemJournalLine@1000000001 : Record 83;
    //   ILE@1000000002 : Record 32;
    //   ReservationEntry@1000000003 : Record 337;
    //   InvSetup@1000000004 : Record 313;
    //   ItemJnlPost@1000000005 : Codeunit 241;
    //   TrackingSpecification@1000000006 : Record 336;
    //   ItemLoc@1170000000 : Record 27;
    //   InventorySetup@1170000001 : Record 313;
    //   ConsIJL@1170000002 : Record 83;
    //   IndentHeader@1000000007 : Record 50005;
    //   Cu22@1000000008 : Codeunit 22;
    // BEGIN

    //   InvSetup.GET;
    //   //PRU-VG 4.0
    //   IndentHeader.RESET;
    //   IndentHeader.SETRANGE("Indent No.",IndentLineLoc."Document No.");
    //   IF IndentHeader.FINDFIRST THEN
    //   //InvSetup.TESTFIELD("Indent Batch Name");
    //   ItemJournalLine.INIT;
    //   ItemJournalLine."Journal Template Name" := 'RECLASS';
    //   ItemJournalLine."Journal Batch Name" := 'DEFAULT';
    //   ItemJournalLine."Line No." := GetLineNoIssue('RECLASS',InvSetup."Indent Batch Name");//Pru_gk
    //   ItemJournalLine."Document No." := IndentHeader."Indent No.";
    //   ItemJournalLine."Entry Type" := ItemJournalLine."Entry Type"::Transfer;
    //   ItemJournalLine.VALIDATE("Item No.",IndentLineLoc."No.");
    //   //ItemJournalLine.VALIDATE("Variant Code",IndentLine."Variant Code");
    //   ItemJournalLine."Posting Date" := WORKDATE;
    //   ItemJournalLine.VALIDATE("Location Code",IndentHeader."From Location");
    //   ItemJournalLine.VALIDATE(Quantity,IndentLineLoc.Quantity);
    //   ItemJournalLine.VALIDATE("Unit of Measure Code",IndentLineLoc."Unit of Measure Code");
    //   ItemJournalLine.VALIDATE("New Location Code",IndentHeader."Required Location");
    //   ItemJournalLine.VALIDATE("Shortcut Dimension 1 Code",IndentHeader."Shortcut Dimension 1 Code");
    //   ItemJournalLine.VALIDATE("New Shortcut Dimension 1 Code",IndentHeader."Shortcut Dimension 1 Code");
    //   {TrackingSpecification.RESET;
    //   TrackingSpecification.SETRANGE("Item No.",IssueLine."Item Code");
    //   TrackingSpecification.SETRANGE("Location Code",IssueLine."From Location");
    //   TrackingSpecification.SETRANGE("Quantity (Base)",IssueLine."Issue Qty");
    //   IF TrackingSpecification.FINDLAST THEN BEGIN
    //     ItemJournalLine.VALIDATE("Serial No.",TrackingSpecification."Serial No.");
    //     //MESSAGE('%1',ItemJournalLine."Serial No.")
    //   END;}
    //   //PRU_RPG ItemJournalLine.INSERT;
    //   ReservationEntry.RESET;
    //   ReservationEntry.SETRANGE("Item No.",IndentLineLoc."No.");
    //   ReservationEntry.SETRANGE("Location Code",IndentHeader."From Location");
    //   ReservationEntry.SETRANGE("Source ID",'RECLASS');
    //   //ReservationEntry.SETRANGE("Source Batch Name",);Pru_gk
    //   IF ReservationEntry.FINDFIRST THEN REPEAT
    //     ItemJournalLine.VALIDATE("Lot No.",TrackingSpecification."Lot No.");
    //     ReservationEntry."Source Ref. No." := ItemJournalLine."Line No.";
    //     ReservationEntry.MODIFY;
    //   UNTIL ReservationEntry.NEXT =0;

    //   {
    //   ILE.RESET;
    //   ILE.SETRANGE("Document No.",RcptLinePurch."Document No.");
    //   ILE.SETRANGE(ILE."Rejected For Item Tracking",TRUE);
    //   ILE.SETRANGE(ILE."Item No.",RcptLinePurch."No.");
    //   ILE.SETFILTER("Serial No.",'<>%1','');
    //   IF ILE.FINDFIRST THEN
    //   REPEAT
    //     ReservationEntry.INIT;
    //     ReservationEntry."Entry No." := GetLastEntryNo;
    //     ReservationEntry."Item No." := ILE."Item No.";
    //     ReservationEntry."Location Code" := ILE."Location Code";
    //     ReservationEntry."Quantity (Base)" := -1;
    //     =Re=servationEntry."Reservation Status" := ReservationEntry."Reservation Status"::Prospect;
    //     ReservationEntry."Creation Date" := WORKDATE;
    //     ReservationEntry."Source Type" := 83;
    //     ReservationEntry."Source Subtype" := 4;
    //     ReservationEntry."Source ID" := 'RECLASS';
    //     ReservationEntry."Source Batch Name" := InvSetup."Rejected Location Batch";
    //     ReservationEntry."Source Ref. No." := ItemJournalLine."Line No.";
    //     ReservationEntry."Serial No." := ILE."Serial No.";
    //     ReservationEntry."Created By" := USERID;
    //     ReservationEntry."Qty. per Unit of Measure" := 1;
    //     ReservationEntry.Quantity := -1;
    //     ReservationEntry.Positive := FALSE;
    //     ReservationEntry."Qty. to Handle (Base)" := -1;
    //     ReservationEntry."Qty. to Invoice (Base)" := -1;
    //     ReservationEntry."New Serial No." := ILE."Serial No.";
    //     ReservationEntry."Item Tracking" := ReservationEntry."Item Tracking" ::"Serial No.";
    //     ReservationEntry.INSERT;
    //   UNTIL ILE.NEXT=0;
    //   }
    //   //PRU-VG 4.0
    //   //ItemJnlPost.RunDirectly(ItemJournalLine);
    //   //Cu22.RunWithCheck(ItemJournalLine);
    //   //CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post Line",ItemJournalLine);
    //   IF ItemLoc.GET(IndentLineLoc."No.") THEN;
    //   //IF ItemLoc."Consumption Item" THEN BEGIN
    //     ConsIJL.INIT;
    //     ConsIJL."Journal Template Name" := 'Item';
    //     ConsIJL."Journal Batch Name" := InventorySetup."Auto Consumption Batch Name";
    //     ConsIJL."Line No." := GetLineNo('Item',InventorySetup."Auto Consumption Batch Name");
    //     ConsIJL."Posting Date" := WORKDATE;
    //     ConsIJL.VALIDATE("Document No.",IndentHeader."Indent No.");
    //     ConsIJL.VALIDATE("Item No.",IndentLineLoc."No.");
    //     ConsIJL.VALIDATE("Entry Type",ConsIJL."Entry Type"::"Negative Adjmt.");
    //     ConsIJL.VALIDATE(Quantity,IndentLineLoc.Quantity);
    //     ConsIJL.VALIDATE("Location Code",IndentHeader."Required Location");
    //     ConsIJL.VALIDATE("Shortcut Dimension 1 Code",IndentHeader."Shortcut Dimension 1 Code");
    //     Cu22.RunWithCheck(ConsIJL);
    //   //END;
    // END;

    PROCEDURE GetLineNo(ParaTemplate: Code[20]; ParaBatch: Code[20]): Integer;
    VAR
        ParaItemJnl: Record "Item Journal Line";
    BEGIN
        ParaItemJnl.RESET;
        ParaItemJnl.SETRANGE(ParaItemJnl."Journal Template Name", ParaTemplate);
        ParaItemJnl.SETRANGE(ParaItemJnl."Journal Batch Name", ParaBatch);
        IF ParaItemJnl.FINDLAST THEN
            EXIT(ParaItemJnl."Line No." + 10)
        ELSE
            EXIT(10);
    END;

    // PROCEDURE CalculateInv(PeraIL : Record 50006);
    // VAR
    //   SafetyStock@1000000001 : Decimal;
    //   QtyonPurchOrder@1000000002 : Decimal;
    //   QtyOnProdOrder@1000000003 : Decimal;
    // BEGIN
    //   //PRU-VR1.00
    //   IF (PeraIL."No." <> '') THEN BEGIN
    //     Item.RESET;
    //     Item.SETRANGE("No.",PeraIL."No.");
    //     IF PeraIL.Location <> '' THEN
    //       Item.SETRANGE("Location Filter",PeraIL.Location);
    //       Item.FINDFIRST;
    //      SafetyStock := Item."Safety Stock Quantity" ;

    //     IF Item.CALCFIELDS(Item."Qty. on Purch. Order") THEN
    //       QtyonPurchOrder := Item."Qty. on Purch. Order"
    //     ELSE
    //       QtyonPurchOrder :=0;
    //     IF Item.CALCFIELDS(Item."Qty. on Prod. Order") THEN
    //       QtyOnProdOrder := Item."Qty. on Prod. Order"
    //     ELSE
    //       QtyOnProdOrder := 0;
    //       LeadTime := Item."Lead Time Calculation";
    //   END
    //     ELSE BEGIN
    //      SafetyStock := 0;
    //      QtyonPurchOrder :=0;
    //      QtyOnProdOrder := 0;
    //      CLEAR("Purchase Period");
    //      CLEAR("Safety Stock Period");
    //      CLEAR(LeadTime);
    //     END;
    //   //PRU-VR1.00
    // END;

    PROCEDURE CheckCreditLimit_PTPL(VAR ParaSalesHeader: Record "Sales Header");
    VAR
        CustPostGrp: Record "Customer Posting Group";
        SalesHeader_T36: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TotalOutstandingAmount: Decimal;
        TotalRemAmount: Decimal;
        recSalesHeader1: Record "Sales Header";
        PaymentTerms1: Record "Payment Terms";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        TotalCheckLimitAmount: Decimal;
        recCustomer: Record Customer;
        T18: Record Customer;
        recSalesHeader2: Record "Sales Line";
        OpenAmount: Decimal;
        Rec_18: Record Customer;
        T36: Record "Sales Header";
        T21: Record "Cust. Ledger Entry";
        TotalAmount: Decimal;
    BEGIN
        SalesHeader_T36.RESET;
        SalesHeader_T36.SETRANGE("No.", ParaSalesHeader."No.");
        IF SalesHeader_T36.FINDFIRST THEN BEGIN
            //SalesHeader_T36.CALCFIELDS("Amount to Customer"); //Field not availbale in W1 edition
            //IF SalesHeader_T36."Amount to Customer" <> 0 THEN BEGIN
            //SalesHeader_T36.CALCFIELDS("Price Inclusive of Taxes");  //Field not availbale in W1 edition
            CLEAR(TotalOutstandingAmount);
            CLEAR(TotalRemAmount);
            T18.GET(SalesHeader_T36."Sell-to Customer No.");
            //IF T18."Distributor Code" <> '' THEN BEGIN  //Field not availbale in W1 edition
            Rec_18.RESET;
            //Rec_18.SETRANGE("Distributor Code",T18."Distributor Code"); //Field not availbale in W1 edition
            IF Rec_18.FINDFIRST THEN BEGIN
                REPEAT
                    recSalesHeader1.RESET;
                    recSalesHeader1.SETRANGE("Sell-to Customer No.", Rec_18."No.");
                    recSalesHeader1.SETRANGE("Document Type", recSalesHeader1."Document Type"::Order);
                    IF recSalesHeader1.FINDSET THEN BEGIN
                        REPEAT
                        //recSalesHeader1.CALCFIELDS("Amount to Customer"); //Field not availbale in W1 edition
                        //TotalOutstandingAmount += recSalesHeader1."Amount to Customer"; //Field not availbale in W1 edition
                        UNTIL recSalesHeader1.NEXT = 0;
                    END;
                UNTIL Rec_18.NEXT = 0;
            END;
            CLEAR(OpenAmount);
            T36.RESET;
            //T36.SETRANGE("Sell-to Customer No.",T18."Distributor Code");  //Field not availbale in W1 edition
            T36.SETRANGE("Document Type", T36."Document Type"::Order);
            IF T36.FINDFIRST THEN BEGIN
                REPEAT
                //T36.CALCFIELDS("Amount to Customer");  //Field not availbale in W1 edition
                //OpenAmount += T36."Amount to Customer";  //Field not availbale in W1 edition
                UNTIL T36.NEXT = 0;
            END;
        END;
        T18.GET(SalesHeader_T36."Sell-to Customer No.");
        //IF T18."Distributor Code" <> '' THEN BEGIN    //Field not availbale in W1 edition
        Rec_18.RESET;
        //Rec_18.SETRANGE("Distributor Code",T18."Distributor Code");   //Field not availbale in W1 edition
        IF Rec_18.FINDFIRST THEN BEGIN
            REPEAT
                CustLedgerEntry.RESET;
                CustLedgerEntry.SETRANGE("Customer No.", Rec_18."No.");
                CustLedgerEntry.SETRANGE(Open, TRUE);
                IF CustLedgerEntry.FINDSET THEN BEGIN
                    REPEAT
                        CustLedgerEntry.CALCFIELDS("Remaining Amount");
                        TotalRemAmount += CustLedgerEntry."Remaining Amount";
                    UNTIL CustLedgerEntry.NEXT = 0;
                END;
            UNTIL Rec_18.NEXT = 0;
        END;
        CLEAR(TotalAmount);
        T21.RESET;
        //T21.SETRANGE("Customer No.",T18."Distributor Code");    //Field not availbale in W1 edition
        T21.SETRANGE(Open, TRUE);
        IF T21.FINDSET THEN BEGIN
            REPEAT
                T21.CALCFIELDS("Remaining Amount");
                TotalAmount += T21."Remaining Amount";
            UNTIL T21.NEXT = 0;
        END;
        //END;
        CLEAR(TotalCheckLimitAmount);
        TotalCheckLimitAmount := TotalOutstandingAmount + TotalRemAmount + OpenAmount + TotalAmount;
        //SalesHeader_T36.CALCFIELDS("Amount to Customer");   //Field not availbale in W1 edition
        recCustomer.RESET;
        //recCustomer.SETRANGE("No.",T18."Distributor Code");    //Field not availbale in W1 edition
        IF recCustomer.FINDFIRST THEN BEGIN
            //MESSAGE('%1',TotalCheckLimitAmount);
            IF recCustomer."Credit Limit (LCY)" < (TotalCheckLimitAmount) THEN
                ERROR('Credit limit amount is exceeding.Please send approval.')
        END;
        // END;
        //END;

    END;

    PROCEDURE BaseCheckCreditLimit_PTPL(VAR ParaSalesHeader: Record "Sales Header");
    VAR
        SalesHeader_T36: Record "Sales Header";
        TotalOutstandingAmount: Decimal;
        TotalRemAmount: Decimal;
        recSalesHeader1: Record "Sales Header";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        TotalCheckLimitAmount: Decimal;
        recCustomer: Record Customer;
    BEGIN
        ///////Pru_GK Start
        SalesHeader_T36.RESET;
        SalesHeader_T36.SETRANGE("No.", ParaSalesHeader."No.");
        IF SalesHeader_T36.FINDFIRST THEN BEGIN
            //SalesHeader_T36.CALCFIELDS("Price Inclusive of Taxes"); //Field not availbale in W1 edition
            CLEAR(TotalOutstandingAmount);
            CLEAR(TotalRemAmount);
            recSalesHeader1.RESET;
            recSalesHeader1.SETRANGE("Sell-to Customer No.", ParaSalesHeader."Sell-to Customer No.");
            recSalesHeader1.SETRANGE("Document Type", recSalesHeader1."Document Type"::Order);
            IF recSalesHeader1.FINDSET THEN BEGIN
                REPEAT
                //recSalesHeader1.CALCFIELDS("Amount to Customer"); //Field not availbale in W1 edition
                //TotalOutstandingAmount += recSalesHeader1."Amount to Customer"; //Field not availbale in W1 edition
                UNTIL recSalesHeader1.NEXT = 0;
            END;
            CustLedgerEntry.RESET;
            CustLedgerEntry.SETRANGE("Customer No.", ParaSalesHeader."Sell-to Customer No.");
            CustLedgerEntry.SETRANGE(Open, TRUE);
            IF CustLedgerEntry.FINDSET THEN BEGIN
                REPEAT
                    CustLedgerEntry.CALCFIELDS("Remaining Amount");
                    TotalRemAmount += CustLedgerEntry."Remaining Amount";
                UNTIL CustLedgerEntry.NEXT = 0;
            END;
            CLEAR(TotalCheckLimitAmount);
            TotalCheckLimitAmount := TotalOutstandingAmount + TotalRemAmount;
            //SalesHeader_T36.CALCFIELDS("Amount to Customer"); //Field not availbale in W1 edition
            recCustomer.RESET;
            recCustomer.SETRANGE("No.", ParaSalesHeader."Sell-to Customer No.");
            IF recCustomer.FINDFIRST THEN BEGIN
                IF recCustomer."Credit Limit (LCY)" < (TotalCheckLimitAmount) THEN
                    ERROR('Credit limit amount is exceeding.Please send approval.')
            END;
        END;
    END;

    // PROCEDURE CheckCreditLimit_Distributor@1000000017(VAR ParaSalesHeader@1000000014 : Record 36);
    // VAR
    //   CustPostGrp@1000000000 : Record 92;
    //   SalesHeader_T36@1000000001 : Record 36;
    //   SalesLine@1000000002 : Record 37;
    //   TotalOutstandingAmount@1000000003 : Decimal;
    //   TotalRemAmount@1000000004 : Decimal;
    //   recSalesHeader1@1000000005 : Record 36;
    //   PaymentTerms1@1000000006 : Record 3;
    //   CustLedgerEntry@1000000007 : Record 21;
    //   TotalCheckLimitAmount@1000000008 : Decimal;
    //   recCustomer@1000000009 : Record 18;
    //   T18@1000000010 : Record 18;
    //   recSalesHeader2@1000000011 : Record 37;
    //   OpenAmount@1000000012 : Decimal;
    //   Rec_18@1000000013 : Record 18;
    //   T36@1000000015 : Record 36;
    //   T21@1000000016 : Record 21;
    //   TotalAmount@1000000017 : Decimal;
    // BEGIN
    //   ///////Pru_GK Start
    //   SalesHeader_T36.RESET;
    //   SalesHeader_T36.SETRANGE("No.",ParaSalesHeader."No.");
    //   IF SalesHeader_T36.FINDFIRST THEN BEGIN
    //     SalesHeader_T36.CALCFIELDS("Price Inclusive of Taxes");
    //     CLEAR(TotalOutstandingAmount);
    //     CLEAR(TotalRemAmount);
    //     CLEAR(OpenAmount);

    //     IF SalesHeader_T36.Distributor THEN BEGIN
    //       T18.GET(SalesHeader_T36."Sell-to Customer No.");
    //       T36.RESET;
    //         T36.SETRANGE("Sell-to Customer No.",SalesHeader_T36."Sell-to Customer No.");
    //         T36.SETRANGE("Document Type",T36."Document Type"::Order);
    //         IF T36.FINDSET THEN BEGIN
    //           REPEAT
    //             T36.CALCFIELDS("Amount to Customer");
    //             OpenAmount += T36."Amount to Customer";
    //           UNTIL T36.NEXT = 0 ;
    //         END;
    //       Rec_18.RESET;
    //       Rec_18.SETRANGE("Distributor Code",SalesHeader_T36."Sell-to Customer No.");
    //       IF Rec_18.FINDFIRST THEN BEGIN REPEAT
    //           recSalesHeader1.RESET;
    //           recSalesHeader1.SETRANGE("Sell-to Customer No.",Rec_18."No.");
    //           recSalesHeader1.SETRANGE("Document Type",recSalesHeader1."Document Type"::Order);
    //           IF  recSalesHeader1.FINDSET THEN BEGIN
    //             REPEAT
    //               recSalesHeader1.CALCFIELDS("Amount to Customer");
    //               TotalOutstandingAmount += recSalesHeader1."Amount to Customer";
    //             UNTIL recSalesHeader1.NEXT = 0;
    //           END;
    //       UNTIL Rec_18.NEXT = 0 ;
    //       END;
    //     END;

    //     T18.GET(SalesHeader_T36."Sell-to Customer No.");
    //     IF T18.Distributor THEN BEGIN
    //       T21.RESET;
    //       T21.SETRANGE("Customer No.",SalesHeader_T36."Sell-to Customer No.");
    //       T21.SETRANGE(Open,TRUE);
    //       IF T21.FINDSET THEN BEGIN
    //         REPEAT
    //           T21.CALCFIELDS("Remaining Amount");
    //           TotalAmount += T21."Remaining Amount";
    //         UNTIL T21.NEXT = 0 ;
    //       END;
    //       T18.GET(SalesHeader_T36."Sell-to Customer No.");
    //         Rec_18.RESET;
    //         Rec_18.SETRANGE("Distributor Code",T18."No.");
    //         IF Rec_18.FINDFIRST THEN BEGIN REPEAT
    //           CustLedgerEntry.RESET;
    //           CustLedgerEntry.SETRANGE("Customer No.",Rec_18."No.");
    //           CustLedgerEntry.SETRANGE(Open,TRUE);
    //           IF CustLedgerEntry.FINDSET THEN BEGIN
    //             REPEAT
    //               CustLedgerEntry.CALCFIELDS("Remaining Amount");
    //               TotalRemAmount += CustLedgerEntry."Remaining Amount";
    //             UNTIL CustLedgerEntry.NEXT = 0;
    //           END;
    //         UNTIL Rec_18.NEXT = 0 ;
    //         END;
    //     END;
    //       CLEAR(TotalCheckLimitAmount);
    //       TotalCheckLimitAmount := TotalOutstandingAmount+TotalRemAmount + OpenAmount + TotalAmount;
    //       SalesHeader_T36.CALCFIELDS("Amount to Customer");
    //       recCustomer.RESET;
    //       recCustomer.SETRANGE("No.",SalesHeader_T36."Sell-to Customer No.");
    //       IF recCustomer.FINDFIRST THEN BEGIN
    //         IF  recCustomer."Credit Limit (LCY)" < (TotalCheckLimitAmount)  THEN
    //           //MESSAGE('%1',TotalCheckLimitAmount);
    //           ERROR('Credit limit amount is exceeding.Please send approval.')
    //       END;
    //   END;

    //   ///////Pru_GK
    //    //<< CREDIT LIMIT STOP
    // END;

    // PROCEDURE CalcCreditLimitLCY_PTPL@1000000016(VAR ParaSalesLine@1000000002 : Record 37);
    // VAR
    //   TempCustomer@1000000000 : TEMPORARY Record 18;
    //   Rec_Customer@1000000001 : Record 18;
    //   T36_Loc@1000000003 : Record 36;
    //   OutstandingRetOrdersLCY@1000000004 : Decimal;
    //   RcdNotInvdRetOrdersLCY@1000000005 : Decimal;
    //   OrderAmountTotalLCY@1000000006 : Decimal;
    //   CustCreditAmountLCY@1000000007 : Decimal;
    // BEGIN
    //   CLEAR(CustCreditAmountLCY);
    //   CLEAR(OutstandingRetOrdersLCY);
    //   CLEAR(RcdNotInvdRetOrdersLCY);
    //   T36_Loc.GET(ParaSalesLine."Document Type",ParaSalesLine."Document No.");
    //   IF T36_Loc."Distributor Code" <> '' THEN BEGIN
    //     {TempCustomer.INIT;
    //     TempCustomer."No." := T36_Loc."Distributor Code";
    //     TempCustomer.INSERT;}
    //     Rec_Customer.GET(T36_Loc."Distributor Code");
    //     CalcReturnAmounts_PTPL(OutstandingRetOrdersLCY,RcdNotInvdRetOrdersLCY,Rec_Customer."No.");
    //     OrderAmountTotalLCY := CalcTotalOutstandingAmt_PTPL(Rec_Customer) - OutstandingRetOrdersLCY ;///+ DeltaAmount;

    //     {IF Rec_Customer."No." = CustNo THEN
    //      OrderAmountThisOrderLCY := NewOrderAmountLCY
    //     ELSE
    //      OrderAmountThisOrderLCY := 0;}
    //     CustCreditAmountLCY +=
    //     Rec_Customer."Balance (LCY)" + Rec_Customer."Shipped Not Invoiced (LCY)" + Rec_Customer."Serv Shipped Not Invoiced(LCY)" - RcdNotInvdRetOrdersLCY +
    //     OrderAmountTotalLCY - GetInvoicedPrepmtAmountLCY_PTPL(Rec_Customer."No.");
    //     MESSAGE('b...%1',CustCreditAmountLCY);
    //     Rec_Customer.RESET;
    //     Rec_Customer.SETRANGE("Distributor Code",T36_Loc."Distributor Code");
    //     IF Rec_Customer.FINDSET THEN REPEAT
    //       {TempCustomer.INIT;
    //       TempCustomer."No." := Rec_Customer."No.";
    //       TempCustomer.INSERT;}
    //       CalcReturnAmounts_PTPL(OutstandingRetOrdersLCY,RcdNotInvdRetOrdersLCY,Rec_Customer."No.");
    //     OrderAmountTotalLCY := CalcTotalOutstandingAmt_PTPL(Rec_Customer) - OutstandingRetOrdersLCY ;///+ DeltaAmount;
    //     {IF Rec_Customer."No." = CustNo THEN
    //      OrderAmountThisOrderLCY := NewOrderAmountLCY
    //     ELSE
    //      OrderAmountThisOrderLCY := 0;}
    //     CustCreditAmountLCY +=
    //     Rec_Customer."Balance (LCY)" + Rec_Customer."Shipped Not Invoiced (LCY)" + Rec_Customer."Serv Shipped Not Invoiced(LCY)" - RcdNotInvdRetOrdersLCY +
    //     OrderAmountTotalLCY - GetInvoicedPrepmtAmountLCY_PTPL(Rec_Customer."No.");
    //     MESSAGE('a...%1',CustCreditAmountLCY);
    //     UNTIL Rec_Customer.NEXT =0;
    //   END;
    //   {
    //   Rec_Customer.RESET;
    //   Rec_Customer.SETRANGE("No.",TempCustomer."No.");
    //   Rec_Customer.SETFILTER("Date Filter",'..%1',WORKDATE);
    //   Rec_Customer.SETAUTOCALCFIELDS("Balance (LCY)","Shipped Not Invoiced (LCY)","Serv Shipped Not Invoiced(LCY)");
    //   IF Rec_Customer.FINDSET THEN REPEAT

    //     CalcReturnAmounts_PTPL(OutstandingRetOrdersLCY,RcdNotInvdRetOrdersLCY,Rec_Customer."No.");
    //     OrderAmountTotalLCY := CalcTotalOutstandingAmt_PTPL(Rec_Customer) - OutstandingRetOrdersLCY ;///+ DeltaAmount;
    //     {IF Rec_Customer."No." = CustNo THEN
    //      OrderAmountThisOrderLCY := NewOrderAmountLCY
    //     ELSE
    //      OrderAmountThisOrderLCY := 0;}
    //     CustCreditAmountLCY +=
    //     Rec_Customer."Balance (LCY)" + Rec_Customer."Shipped Not Invoiced (LCY)" + Rec_Customer."Serv Shipped Not Invoiced(LCY)" - RcdNotInvdRetOrdersLCY +
    //     OrderAmountTotalLCY - GetInvoicedPrepmtAmountLCY_PTPL(Rec_Customer."No.");
    //     MESSAGE('%1',CustCreditAmountLCY);
    //   UNTIL Rec_Customer.NEXT =0;
    //   }
    // END;

    // PROCEDURE CalcReturnAmounts_PTPL@9(VAR OutstandingRetOrdersLCY2@1001 : Decimal;VAR RcdNotInvdRetOrdersLCY2@1002 : Decimal;VAR ParaCustNo@1000000000 : Code[20]) : Decimal;
    // VAR
    //   SalesLine@1000000001 : Record 37;
    // BEGIN
    //   SalesLine.RESET;
    //   SalesLine.SETCURRENTKEY("Document Type","Bill-to Customer No.","Currency Code");
    //   SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::"Return Order");
    //   SalesLine.SETRANGE("Bill-to Customer No.",ParaCustNo);
    //   SalesLine.CALCSUMS("Outstanding Amount (LCY)","Return Rcd. Not Invd. (LCY)");
    //   OutstandingRetOrdersLCY2 := SalesLine."Outstanding Amount (LCY)";
    //   RcdNotInvdRetOrdersLCY2 := SalesLine."Return Rcd. Not Invd. (LCY)";
    // END;

    // PROCEDURE CalcTotalOutstandingAmt_PTPL@13(VAR ParaCust@1000000000 : Record 18) : Decimal;
    // VAR
    //   SalesLine@1000 : Record 37;
    //   SalesOutstandingAmountFromShipment@1001 : Decimal;
    //   ServOutstandingAmountFromShipment@1002 : Decimal;
    //   ServLine@1000000001 : Record 5902;
    // BEGIN
    //   ParaCust.CALCFIELDS(
    //     "Outstanding Invoices (LCY)","Outstanding Orders (LCY)","Outstanding Serv.Invoices(LCY)","Outstanding Serv. Orders (LCY)");
    //   SalesOutstandingAmountFromShipment := SalesLine.OutstandingInvoiceAmountFromShipment(ParaCust."No.");
    //   ServOutstandingAmountFromShipment := ServLine.OutstandingInvoiceAmountFromShipment(ParaCust."No.");

    //   EXIT(
    //     ParaCust."Outstanding Orders (LCY)" + ParaCust."Outstanding Invoices (LCY)" + ParaCust."Outstanding Serv. Orders (LCY)" +
    //     ParaCust."Outstanding Serv.Invoices(LCY)" - SalesOutstandingAmountFromShipment - ServOutstandingAmountFromShipment);
    // END;

    PROCEDURE GetInvoicedPrepmtAmountLCY_PTPL(ParaCustNo: Code[20]): Decimal;
    VAR
        SalesLine: Record "Sales Line";
    BEGIN
        SalesLine.SETCURRENTKEY("Document Type", "Bill-to Customer No.");
        SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SETRANGE("Bill-to Customer No.", ParaCustNo);
        SalesLine.CALCSUMS("Prepmt. Amount Inv. (LCY)", "Prepmt. VAT Amount Inv. (LCY)");
        EXIT(SalesLine."Prepmt. Amount Inv. (LCY)" + SalesLine."Prepmt. VAT Amount Inv. (LCY)");
    END;

    // PROCEDURE CheckValidationofBatch(VAR Para38 : Record "Purchase Header");
    // VAR
    //   Item_Loc : Record Item;
    //   T50010_Loc : Record 50010;
    //   T39_Loc : Record "Purchase Line";
    // BEGIN
    //   T39_Loc.RESET;
    //   T39_Loc.SETRANGE("Document Type",Para38."Document Type"::Order);
    //   T39_Loc.SETRANGE("Document No.",Para38."No.");
    //   T39_Loc.SETRANGE(Type,T39_Loc.Type::Item);
    //   T39_Loc.SETFILTER("Qty. to Receive",'<>%1',0);
    //   IF T39_Loc.FINDSET THEN REPEAT
    //     Item_Loc.GET(T39_Loc."No.");
    //     IF Item_Loc."Item Tracking Code" <> '' THEN BEGIN
    //       T39_Loc.TESTFIELD("No. of Batch");

    //       T50010_Loc.RESET;
    //       T50010_Loc.SETRANGE("Document Type",T50010_Loc."Document Type"::Purchase);
    //       T50010_Loc.SETRANGE("Order No.",T39_Loc."Document No.");
    //       T50010_Loc.SETRANGE("Line No.",T39_Loc."Line No.");
    //       T50010_Loc.SETRANGE(Posted,FALSE);
    //       IF NOT T50010_Loc.FINDFIRST THEN
    //         ERROR('Kindly create Batch for the Purchase Order %1 Line No. %2',T39_Loc."Document No.",T39_Loc."Line No.");

    //       T50010_Loc.RESET;
    //       T50010_Loc.SETRANGE("Document Type",T50010_Loc."Document Type"::Purchase);
    //       T50010_Loc.SETRANGE("Order No.",T39_Loc."Document No.");
    //       T50010_Loc.SETRANGE("Line No.",T39_Loc."Line No.");
    //       T50010_Loc.SETRANGE(Posted,FALSE);

    //       T50010_Loc.CALCSUMS(Weight,"No. of Coils");
    //       IF T50010_Loc."No. of Coils" < T39_Loc."No. of Batch" THEN
    //         ERROR('Total No. of Batch %1 still Pending to be create for Line No. %2',T39_Loc."No. of Batch"-T50010_Loc."No. of Coils",T39_Loc."Line No.");
    //       IF T50010_Loc.Weight <> T39_Loc."Qty. to Receive" THEN
    //         ERROR('Total Weight of Batch Creation is not equal to Qty. to Receive for Line No. %1',T39_Loc."Line No.");
    //     END;
    //   UNTIL T39_Loc.NEXT=0;
    // END;

    PROCEDURE ItemReclass(VAR ParaIssueh: Record "Issue Slip Header");
    VAR
        ItemJournalRec: Record "Item Journal Line";
        IssueSlipLine: Record "Issue Slip Line";
        ReservationEntry: Record "Reservation Entry";
        C22: Codeunit "Item Jnl.-Post Line";
    BEGIN
        IF CONFIRM('Do you want to Post Issue slip', TRUE) THEN BEGIN
            IssueSlipLine.RESET;
            IssueSlipLine.SETRANGE("Document No.", ParaIssueh."No.");
            IF IssueSlipLine.FINDSET THEN BEGIN
                REPEAT
                    ItemJournalRec.INIT;
                    ItemJournalRec."Journal Batch Name" := 'DEFAULT';
                    ItemJournalRec."Journal Template Name" := 'TRANSFER';
                    ItemJournalRec."Posting Date" := WORKDATE;
                    ItemJournalRec."Entry Type" := ItemJournalRec."Entry Type"::Transfer;
                    ItemJournalRec."Document No." := ParaIssueh."No.";
                    ItemJournalRec."Line No." := ItemJournalRec."Line No." + 10000;
                    ItemJournalRec.VALIDATE("Item No.", IssueSlipLine."Item No.");
                    ItemJournalRec.VALIDATE("Shortcut Dimension 1 Code", ParaIssueh."Shortcut Dimension 1 Code");
                    ItemJournalRec.VALIDATE("Shortcut Dimension 2 Code", ParaIssueh."Shortcut Dimension 2 Code");
                    ItemJournalRec.VALIDATE("New Shortcut Dimension 1 Code", ParaIssueh."Shortcut Dimension 1 Code");
                    ItemJournalRec.VALIDATE("New Shortcut Dimension 2 Code", ParaIssueh."Shortcut Dimension 2 Code");
                    ItemJournalRec.VALIDATE(Quantity, IssueSlipLine."Required Quantity");
                    ItemJournalRec.VALIDATE("Location Code", ParaIssueh."From Location Code");
                    ItemJournalRec."Document Date" := ParaIssueh."Posting Date";
                    ItemJournalRec.VALIDATE("New Location Code", ParaIssueh."Required Location Code");
                    ReservationEntry.RESET;
                    ReservationEntry.SETRANGE("Source ID", IssueSlipLine."Document No.");
                    ReservationEntry.SETRANGE("Source Ref. No.", IssueSlipLine."Line No.");
                    IF ReservationEntry.FINDFIRST THEN
                        REPEAT
                            ReservationEntry."Source ID" := 'TRANSFER';
                            ReservationEntry."Source Ref. No." := ItemJournalRec."Line No.";
                            ReservationEntry.MODIFY;
                        UNTIL ReservationEntry.NEXT = 0;
                    IF C22.RunWithCheck(ItemJournalRec) THEN BEGIN
                        ParaIssueh.Status := ParaIssueh.Status::Posted;
                    END;
                UNTIL IssueSlipLine.NEXT = 0;
            END;
            MESSAGE('Issue Slip Post Successfully');
        END;
    END;
}

