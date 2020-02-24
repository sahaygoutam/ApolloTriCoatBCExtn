page 50124 "Size Master"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Master Setup";
    SourceTableView = WHERE ("Default Code" = CONST ('SIZE'));

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Default Code Value"; "Default Code Value")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Size Code';
                }
                field("Default Text Value"; "Default Text Value")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}