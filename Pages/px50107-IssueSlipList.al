page 50107 "Issue Slip List"
{
    PageType = List;
    Editable = false;
    DeleteAllowed = false;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Issue Slip Header";
    SourceTableView = WHERE (Status = CONST (Open));
    CardPageId = "Issue Slip Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; "No.")
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
            }
        }
    }

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
}