page 50110 "Posted Issue Slip Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Issue Slip Header";
    SourceTableView = WHERE (Status = CONST (Posted));
    InsertAllowed = false;
    ModifyAllowed = false;
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
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                }
                field("From Location Code"; "From Location Code")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        IF AssistEdit1(xRec) THEN
                            CurrPage.UPDATE;
                    end;
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
            }
            part(SubPage; "Issue Slip Subform")
            {
                SubPageLink = "Document No." = FIELD ("No."), "From Location Code" = FIELD ("From Location Code");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Print)
            {
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                var
                    RGP: Record "Issue Slip Header";
                begin
                    RGP.RESET;
                    RGP.SETRANGE("From Location Code", "From Location Code");
                    IF RGP.FINDFIRST THEN
                        REPORT.RUNMODAL(50105, TRUE, FALSE, RGP);
                end;
            }
            action(Dimensions)
            {
                Image = Dimensions;
                ShortcutKey = "Shift+Ctrl+D";
                trigger OnAction()
                var
                    IssueSlipvalidate: Codeunit "Issue Slip validate";
                begin
                    IssueSlipvalidate.ShowDimensions(Rec);
                    CurrPage.SAVERECORD;
                end;
            }
            action("Material Req Slip Report")
            {
                image = Print;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    IssueSlipHeader: Record "Issue Slip Header";
                begin
                    IssueSlipHeader.RESET;
                    CurrPage.SETSELECTIONFILTER(IssueSlipHeader);
                    IF IssueSlipHeader.FINDFIRST THEN
                        REPORT.RUNMODAL(50127, TRUE, FALSE, IssueSlipHeader);
                end;
            }
        }
    }
}