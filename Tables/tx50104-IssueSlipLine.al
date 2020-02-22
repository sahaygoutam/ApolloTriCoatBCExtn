table 50104 "Issue Slip Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                IssueSlipHeader: Record "Issue Slip Header";
            begin
                Item.GET("Item No.");
                Description := Item.Description;
                "Unit of Measure Code" := Item."Base Unit of Measure";
                "Qty. per Unit of Measure" := UOMMgt.GetQtyPerUnitOfMeasure(Item, "Unit of Measure Code");
                IssueSlipHeader.RESET;
                IssueSlipHeader.SETRANGE("No.", "Document No.");
                IF IssueSlipHeader.FINDFIRST THEN BEGIN
                    "From Location Code" := IssueSlipHeader."From Location Code";
                    "To Location Code" := IssueSlipHeader."Required Location Code";
                    "Posting Date" := IssueSlipHeader."Posting Date";
                END;
            end;
        }
        field(4; "Required Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Issued Quantity" := "Required Quantity";
            end;
        }
        field(5; "From Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "To Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Unit of Measure Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF Type = Type::Item THEN BEGIN
                    Item.GET("Item No.");
                    "Qty. per Unit of Measure" := UOMMgt.GetQtyPerUnitOfMeasure(Item, "Unit of Measure Code")
                END;
            end;
        }
        field(9; "Qty. per Unit of Measure"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Remaining Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Width; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Grade; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
        }
        field(16; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Item,FA;
        }
        field(17; "Stock In Hand"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Issued Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        UOMMgt: Codeunit "Unit of Measure Management";
        Item: Record Item;
        FixedAsset: Record "Fixed Asset";

    trigger OnInsert()
    begin
        TestField(Type);
    end;

    trigger OnModify()
    begin
        TestField(Type);
    end;

    procedure AssignLotlNumber()
    begin
        TESTFIELD("Item No.");
        TESTFIELD("Required Quantity");
        TESTFIELD("Posting Date");
        TESTFIELD("From Location Code");
        CallItemTracking(Rec);
    end;

    procedure CallItemTracking(var RecIssueLine: Record "Issue Slip Line")
    var
        TrackingSpecification: Record "Tracking Specification";
        ItemTrackingPage: Page "Item Tracking Lines";
        ItemJnlLine: Record "Item Journal Line";
    begin
        ItemTracking(RecIssueLine, TrackingSpecification);
        ItemTrackingPage.SetFormRunMode(1);
        ItemTrackingPage.SetSourceSpec(TrackingSpecification, RecIssueLine."Posting Date");
        ItemTrackingPage.SetInbound(ItemJnlLine.IsInbound);
        ItemTrackingPage.RUNMODAL;
    end;

    procedure ItemTracking(var RecIssueLine: Record "Issue Slip Line"; var TrackingSpecification: Record "Tracking Specification")
    var
        InvSetup: Record "Manufacturing Setup";
    begin
        InvSetup.GET;
        IF RecIssueLine."Required Quantity" > 0 THEN BEGIN
            TrackingSpecification.INIT;
            TrackingSpecification."Source Type" := DATABASE::"Item Journal Line";
            TrackingSpecification."Item No." := RecIssueLine."Item No.";
            TrackingSpecification."Location Code" := RecIssueLine."From Location Code";
            TrackingSpecification."Source Subtype" := TrackingSpecification."Source Subtype"::"4";
            TrackingSpecification."Source ID" := RecIssueLine."Document No.";
            TrackingSpecification."Source Batch Name" := 'DEFAULT';
            TrackingSpecification."Source Prod. Order Line" := 0;
            TrackingSpecification."Source Ref. No." := RecIssueLine."Line No.";
            TrackingSpecification."Quantity (Base)" := RecIssueLine."Required Quantity" * RecIssueLine."Qty. per Unit of Measure";
            TrackingSpecification."Qty. to Handle" := RecIssueLine."Required Quantity" * RecIssueLine."Qty. per Unit of Measure";
            TrackingSpecification."Qty. to Handle (Base)" := RecIssueLine."Required Quantity" * RecIssueLine."Qty. per Unit of Measure";
            TrackingSpecification."Qty. to Invoice" := RecIssueLine."Required Quantity" * RecIssueLine."Qty. per Unit of Measure";
            TrackingSpecification."Qty. to Invoice (Base)" := RecIssueLine."Required Quantity" * RecIssueLine."Qty. per Unit of Measure";
            TrackingSpecification."Quantity Handled (Base)" := 0;
            TrackingSpecification."Quantity Invoiced (Base)" := 0;
            TrackingSpecification."Qty. per Unit of Measure" := RecIssueLine."Qty. per Unit of Measure";
            TrackingSpecification.Correction := FALSE;
        END;
    end;
}