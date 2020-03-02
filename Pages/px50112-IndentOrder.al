page 50112 "Indent Order"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Indent Header";
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = PageEdit;
                field("Indent No."; "Indent No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Indent Date"; "Indent Date")
                {
                    ApplicationArea = All;
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                }
                field("Released Status"; "Released Status")
                {
                    ApplicationArea = All;
                }
                field("User Name"; "User Name")
                {
                    ApplicationArea = All;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = All;
                }
                field("Assigned User ID"; "Assigned User ID")
                {
                    ApplicationArea = All;
                }
                field("Date-Time Sent for Approval"; "Date-Time Sent for Approval")
                {
                    ApplicationArea = All;
                }
                field("Last Date-Time Modified"; "Last Date-Time Modified")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Close Indent")
            {
                ApplicationArea = All;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    C_50002.CloseIndent(Rec);
                    PageEdit := FALSE;
                    CurrPage.UPDATE(FALSE);
                end;
            }
            action("Re-Open Indent")
            {
                ApplicationArea = all;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    C_50002."Re-OpenIndent"(Rec);
                    PageEdit := TRUE;
                    CurrPage.UPDATE(FALSE);
                end;
            }
            action("Approve Indent Lines")
            {
                ApplicationArea = all;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    C_50002.ApproveIndentLines(Rec);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = all;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    IndentLine.RESET;
                    IndentLine.SETRANGE("Document No.", "Indent No.");
                    IF NOT IndentLine.FINDFIRST THEN
                        ERROR('Indent Line is Missing');
                    TESTFIELD("Released Status", "Released Status"::Open);
                    IF IssueSlipValidate.CheckIndentApprovalsWorkflowEnabled(Rec) THEN
                        IssueSlipValidate.OnSendIndentDocForApproval(Rec);

                    CurrPage.UPDATE;
                end;
            }
            action("Issue Indent")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    C_50002.IssueIndent(Rec);
                    CurrPage.SAVERECORD;
                end;
            }
            action(Print)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    IndentHeader: Record "Indent Header";
                begin
                    IndentHeader.RESET;
                    IndentHeader.SETRANGE("Indent No.", "Indent No.");
                    IF IndentHeader.FINDFIRST THEN
                        REPORT.RUNMODAL(50110, TRUE, TRUE, IndentHeader);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    TESTFIELD("Released Status", "Released Status"::"Pending Approval");
                    IssueSlipValidate.OnCancelIndentApprovalRequest(Rec);
                end;
            }
            action("Approve")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
                end;
            }
            action("Reject")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
                end;
            }
            action("Delegate")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
                end;
            }

        }
    }

    var
        IndentLine: Record "Indent Line";
        IndentLine1: Record "Indent Line";
        Usersetup: Record "User Setup";
        RespCntr: Record "Responsibility Center";
        userset: Record "User Setup";
        PageEdit: Boolean;
        IndentHeader: Record "User Wise Res. Center";
        RecordLink: Record "Record Link";
        T83: Record "Item Journal Line";
        RecLocation: Record Location;
        TotalRemainingQty: Decimal;
        IndentLineQty: Decimal;
        TotalRemainingQty1: Decimal;
        ILE: Record "Item Ledger Entry";
        C_50002: Codeunit "Issue Slip validate";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        FieldEdit: Boolean;
        IssueSlipValidate: Codeunit "Issue Slip validate";

    trigger OnOpenPage()
    begin
        Usersetup.GET(USERID);
        FILTERGROUP(2);
        IF NOT Usersetup."HO Users" THEN
            SETFILTER("Shortcut Dimension 1 Code", Usersetup."Global Dimension 1 Code");
        FILTERGROUP(0);

        FILTERGROUP(2);
        IF "Indent Status" = "Indent Status"::Closed THEN
            PageEdit := FALSE
        ELSE
            PageEdit := TRUE;
        IF "Released Status" <> "Released Status"::Open THEN
            PageEdit := FALSE
        ELSE
            PageEdit := TRUE;
        IF "Approval Status" = "Approval Status"::Issued THEN
            PageEdit := FALSE
        ELSE
            PageEdit := TRUE;
        FILTERGROUP(0);

        IF "Released Status" <> "Released Status"::Open THEN
            CurrPage.EDITABLE(FALSE);
    end;

    trigger OnAfterGetRecord()
    begin
        IF "Indent Status" = "Indent Status"::Closed THEN
            PageEdit := FALSE
        ELSE
            PageEdit := TRUE;
        IF "Approval Status" = "Approval Status"::Approved THEN
            PageEdit := FALSE
        ELSE
            PageEdit := TRUE;
        IF "Approval Status" = "Approval Status"::Issued THEN
            PageEdit := FALSE
        ELSE
            PageEdit := TRUE;
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);//B2BAPWF1.0 23Feb2017

        IF "Released Status" <> "Released Status"::Open THEN
            CurrPage.EDITABLE(FALSE);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        IF "Indent Status" = "Indent Status"::Closed THEN
            CurrPage.EDITABLE(FALSE);

        IF "Released Status" <> "Released Status"::Open THEN
            CurrPage.EDITABLE(FALSE);
    end;

    local procedure GetLastLinkNo(): Integer
    var
        RL: Record "Record Link";
    begin
        RL.RESET;
        IF RL.FINDLAST THEN
            EXIT(RL."Link ID" + 1)
        ELSE
            EXIT(1);
    end;
}