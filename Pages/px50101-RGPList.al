page 50101 "RGP List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "RGP/NRGP Header";
    SourceTableView = WHERE ("Document Type" = CONST (RGP), Type = CONST (Normal), Status = FILTER (<> "Ship And Receive"));
    Editable = false;
    CardPageId = "RGP Card";

    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Party Type"; "Party Type")
                {
                    ApplicationArea = All;
                }
                field("Party No."; "Party No.")
                {
                    ApplicationArea = all;
                }
                field("Party Name"; "Party Name")
                {
                    ApplicationArea = all;
                }
                field("External Document No."; "External Document No.")
                {
                    ApplicationArea = all;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = all;
                }
                field("Expected Delivery Date"; "Expected Delivery Date")
                {
                    ApplicationArea = all;
                }
                field("From Location"; "From Location")
                {
                    ApplicationArea = all;
                }
                field("To Location"; "To Location")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        usersetup: Record "User Setup";
    begin
        UserSetup.GET(USERID);
        FILTERGROUP(2);
        IF NOT UserSetup."HO Users" THEN
            SETFILTER("Shortcut Dimension 1 Code", UserSetup."Global Dimension 1 Code");
        FILTERGROUP(0);
    end;
}

