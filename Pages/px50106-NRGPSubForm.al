page 50106 "NRGP Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "RGP/NRGP Line";
    SourceTableView = where ("Document Type" = const (NRGP), Type = const (Normal));
    DelayedInsert = true;
    MultipleNewLines = true;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Option Type"; "Option Type")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                    trigger OnValidate()
                    begin
                        IF RecItem.GET("No.") THEN
                            "Unit Cost" := RecItem."Unit Cost";
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Qty. To Receive"; "Qty. To Receive")
                {
                    ApplicationArea = All;
                    Editable = EditBool;

                    trigger OnValidate()
                    begin
                        IF "Qty. To Receive" > Quantity - "Qty. Received" THEN
                            ERROR('Qty. To Receive must not greater than %1', Quantity - "Qty. Received");
                    end;
                }
                field("Qty. Received"; "Qty. Received")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field(Reason; Reason)
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Unit Cost"; "Unit Cost")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("GST %"; "GST %")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Posted Gate Entry No."; "Posted Gate Entry No.")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
                }
                field("Posted Gate Entry Inward"; "Posted Gate Entry Inward")
                {
                    ApplicationArea = All;
                    Editable = EditBool;
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
        recItem: Record Item;
        EditBool: Boolean;

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