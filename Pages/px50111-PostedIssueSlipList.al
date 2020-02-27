page 50111 "Posted Issue Slip List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Issue Slip Header";
    SourceTableView = WHERE (Status = CONST (Posted));
    CardPageId = "Posted Issue Slip Card";
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

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

    var
        UserSetup: Record "User Setup";

    trigger OnOpenPage()
    begin
        UserSetup.GET(USERID);
        FILTERGROUP(2);
        IF NOT UserSetup."HO Users" THEN
            SETFILTER("Shortcut Dimension 1 Code", UserSetup."Global Dimension 1 Code");
        FILTERGROUP(0);
    end;
}