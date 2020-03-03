page 50113 "Indent Lines"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Indent Line";
    SourceTableView = WHERE ("Released Status" = FILTER (Released), "Remaining Qty" = FILTER (> 0), "Completely Received" = FILTER (false));
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;
    DelayedInsert = true;
    LinksAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Indent Date"; "Indent Date")
                {
                    ApplicationArea = All;
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                }
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field("Released Status"; "Released Status")
                {
                    ApplicationArea = All;
                }
                field("Remaining Qty"; "Remaining Qty")
                {
                    ApplicationArea = All;
                }
                field("PO Approve Qty"; "PO Approve Qty")
                {
                    ApplicationArea = All;
                }
                field("PO Received Qty"; "PO Received Qty")
                {
                    ApplicationArea = All;
                }
                field("Approx Cost"; "Approx Cost")
                {
                    ApplicationArea = All;
                }
                field("Item Category Code"; "Item Category Code")
                {
                    ApplicationArea = All;
                }
                field(Grade; Grade)
                {
                    ApplicationArea = All;
                }
                field(Thickness; Thickness)
                {
                    ApplicationArea = All;
                }
                field(Width; Width)
                {
                    ApplicationArea = All;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        UserSetupRec: Record "User Setup";
        ResponsibilityCenterRec: Record "Responsibility Center";
        RecPurchHeader: Record "Purchase Header";
        IndentLine: Record "Indent Line";
        RecPurchLine1: Record "Purchase Line";
        LineNo: Integer;
        RecPurchLine: Record "Purchase Line";
        RemQty: Decimal;
        RowVisibility: Boolean;
        ItemVendor: Record "Item Vendor";
        userset: Record "User Setup";
        RespCntr: Record "Responsibility Center";
        Text50002: TextConst ENU = 'Item No. %1 can not be purchased from Vendor No. %2. Vendor No. %2 is not an Approved Vendor.';

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        UpdateIndentLines;
        CALCFIELDS("Shortcut Dimension 1 Code");
        FILTERGROUP(2);
        IF userset.GET(USERID) THEN
            SETRANGE("Shortcut Dimension 1 Code", userset."Global Dimension 1 Code");
        CASE RecPurchHeader."Order Type" OF
            RecPurchHeader."Order Type"::RM:
                SETRANGE("Item Category Code", 'RM');
            RecPurchHeader."Order Type"::Consumable:
                SETRANGE("Item Category Code", 'CONS');
            RecPurchHeader."Order Type"::"Capital Order":
                SETRANGE("Capital Items", TRUE);
        END;
        FILTERGROUP(0);
    end;

    procedure UpdateIndentLines()
    begin
        IF IndentLine.FINDSET THEN
            REPEAT
                IndentLine.CALCFIELDS("PO Approve Qty", "PO Received Qty");
                IndentLine."Remaining Qty" := IndentLine.Quantity - (IndentLine."PO Approve Qty" + IndentLine."PO Received Qty");
                IF IndentLine."PO Received Qty" >= IndentLine.Quantity THEN
                    IndentLine."Completely Received" := TRUE
                ELSE
                    IndentLine."Completely Received" := FALSE;
                IndentLine.MODIFY;
            UNTIL IndentLine.NEXT = 0;
    end;
}