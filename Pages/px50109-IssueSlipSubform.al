page 50109 "Issue Slip Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Issue Slip Line";
    DeleteAllowed = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Type; Type)
                {
                    ApplicationArea = All;
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.UPDATE;
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Required Quantity"; "Required Quantity")
                {
                    ApplicationArea = All;
                    Editable = Bool;
                }
                field("Issued Quantity"; "Issued Quantity")
                {
                    ApplicationArea = All;
                    Editable = BoolIss;

                    trigger OnValidate()
                    begin
                        IF "Issued Quantity" > "Required Quantity" THEN
                            ERROR('Issued Quantity is less than Required Quantity');
                    end;
                }
                field("Remaining Quantity"; "Remaining Quantity")
                {
                    ApplicationArea = All;
                }
                field("From Location Code"; "From Location Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("To Location Code"; "To Location Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Remarks; Remarks)
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
            action("Item Tracking Lines")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    CodeunitISH: Codeunit "Issue Slip validate";
                begin
                    CodeunitISH.AssignLotlNumber(Rec);
                end;
            }
        }
    }

    var
        Bool: boolean;
        BoolIss: Boolean;

    trigger OnAfterGetCurrRecord()
    var
        IssueSlipHeader_rec: Record "Issue Slip Header";
    begin
        IssueSlipHeader_Rec.RESET;
        IssueSlipHeader_Rec.SETRANGE("No.", Rec."Document No.");
        IssueSlipHeader_Rec.SETRANGE(Status, IssueSlipHeader_Rec.Status::Requisition);
        IF IssueSlipHeader_Rec.FINDFIRST THEN BEGIN
            Bool := FALSE;
            BoolISS := TRUE;
        END;
        IssueSlipHeader_Rec.RESET;
        IssueSlipHeader_Rec.SETRANGE("No.", Rec."Document No.");
        IssueSlipHeader_Rec.SETRANGE(Status, IssueSlipHeader_Rec.Status::Open);
        IF IssueSlipHeader_Rec.FINDFIRST THEN BEGIN
            Bool := TRUE;
            BoolISS := FALSE;
        END;
    end;
}