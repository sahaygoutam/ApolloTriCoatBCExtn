page 50102 "RGP Card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "RGP/NRGP Header";
    SourceTableView = where ("Document Type" = const (RGP), Type = const (Normal), Status = filter (<> "Ship And Receive"));

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Party Type"; "Party Type")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Party No."; "Party No.")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Party Name"; "Party Name")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Party Address"; "Party Address")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Party Address 2"; "Party Address 2")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Party City"; "Party City")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("State Code"; "State Code")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Order Address Code"; "Order Address Code")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("External Document No."; "External Document No.")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field(Responsibility; Responsibility)
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field(Comment; Comment)
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Expected Delivery Date"; "Expected Delivery Date")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Received Date"; "Received Date")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("From Location"; "From Location")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("To Location"; "To Location")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field(Ship; Ship)
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field(Receive; Receive)
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
            }
            part("RGP SubForm"; "RGP Subform")
            {
                CaptionML = ENU = 'RGP SubForm';
                SubPageLink = "Document Type" = field ("Document Type"), Type = field (Type), "Document No." = field ("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Post;
                PromotedCategory = Process;
                CaptionML = ENU = 'Post';

                trigger OnAction()
                begin
                    IF Ship = TRUE THEN BEGIN
                        "Received Date" := WORKDATE;
                    END;
                    IF Status = Status::Ship THEN
                        IF CONFIRM(Text002, FALSE) THEN
                            PostRGPDocumentReceive(Rec);
                    IF Status = Status::" " THEN
                        IF CONFIRM(Text001, FALSE) THEN
                            PostRGPDocument(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Image = Print;
                PromotedCategory = Process;
                CaptionML = ENU = 'Print';

                trigger OnAction()
                begin
                    RGPNRGPHeader.Reset();
                    CurrPage.SetSelectionFilter(RGPNRGPHeader);
                    if RGPNRGPHeader.FindFirst() then
                        Report.RunModal(50122, true, false, RGPNRGPHeader);
                end;
            }
        }
    }

    var
        EditBool: Boolean;
        Text001: TextConst ENU = 'Do you want to Ship the RGP Document!';
        Text002: TextConst ENU = 'Do you want to Receive the RGP Document!';
        RGPNRGPHeader: Record "RGP/NRGP Header";

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.GET(USERID);
        FILTERGROUP(2);
        IF NOT UserSetup."HO Users" THEN
            SETFILTER("Shortcut Dimension 1 Code", UserSetup."Global Dimension 1 Code");
        FILTERGROUP(0);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        IF "Posted Gate Entry No." <> '' THEN
            EditBool := FALSE
        ELSE
            EditBool := TRUE;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        IF "Posted Gate Entry No." <> '' THEN
            EditBool := FALSE
        ELSE
            EditBool := TRUE;
    end;
}