page 50108 "Issue Slip Card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Issue Slip Header";
    SourceTableView = WHERE (Status = CONST (Open));
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 3 Code"; 'Department')
                {
                    ApplicationArea = All;
                }
                field("From Location Code"; "From Location Code")
                {
                    ApplicationArea = All;
                }
                field("From Location Name"; "From Location Name")
                {
                    ApplicationArea = All;
                }
                field("Required Location Code"; "Required Location Code")
                {
                    ApplicationArea = All;
                }
                field("Required Location Name"; "Required Location Name")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                }
                field("Cost Center Code"; "Cost Center Code")
                {
                    ApplicationArea = All;
                }
            }
            Part(SubPage; "Issue Slip Subform")
            {
                SubPageLink = "Document No." = FIELD ("No.");

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Send For Approved")
            {
                ApplicationArea = All;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    IssueSlipLine.RESET;
                    IssueSlipLine.SETRANGE("Document No.", "No.");
                    IF IssueSlipLine.FINDFIRST THEN
                        REPEAT
                            IssueSlipLine.TESTFIELD("Item No.");
                        UNTIL IssueSlipLine.NEXT = 0;
                    Status := Status::Requisition;
                    CurrPage.UPDATE;
                end;
            }
            action("Material Req Slip Report")
            {
                ApplicationArea = All;
                Image = Print;
                Promoted = true;

                trigger OnAction()
                begin
                    IssueSlipHeader.RESET;
                    CurrPage.SETSELECTIONFILTER(IssueSlipHeader);
                    IF IssueSlipHeader.FINDFIRST THEN
                        REPORT.RUNMODAL(50127, TRUE, FALSE, IssueSlipHeader);
                end;
            }
        }
    }

    var
        IssueSlipHeader: Record "Issue Slip Header";
        IssueSlipLine: Record "Issue Slip Line";
}