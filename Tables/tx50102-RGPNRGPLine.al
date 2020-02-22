Table 50102 "RGP/NRGP Line"
{
    FIELDS
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",RGP,NRGP;
            OptionCaption = ' ,RGP,NRGP';
        }
        field(2; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal,External,Subcontracting';
            OptionMembers = " ",Normal,Subcontracting;
        }
        field(3; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Option Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Item,Fixed Asset';
            OptionMembers = " ",Item,"Fixed Asset";
            trigger OnValidate()
            var
                RGPHeader_Loc: Record "RGP/NRGP Header";
            BEGIN
                RGPHeader_Loc.RESET;
                RGPHeader_Loc.SETRANGE("Document Type", "Document Type");
                RGPHeader_Loc.SETRANGE(Type, Type);
                RGPHeader_Loc.SETRANGE("No.", "Document No.");
                IF RGPHeader_Loc.FINDFIRST THEN
                    "Job Work Location" := RGPHeader_Loc."Job Work Location";
            END;
        }
        field(6; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF ("Option Type" = CONST (Item)) Item
            ELSE
            IF ("Option Type" = CONST ("Fixed Asset")) "Fixed Asset";

            trigger OnValidate()
            // VAR
            //     GSTSetup : Record 16408;
            BEGIN
                IF "Option Type" = "Option Type"::Item THEN BEGIN
                    Item.GET("No.");
                    Description := Item.Description;
                    "Unit of Measure Code" := Item."Base Unit of Measure";
                    "Qty. per Unit of Measure" := UOMMgt.GetQtyPerUnitOfMeasure(Item, "Unit of Measure Code");
                    Length := Item.Length;
                    Width := Item.Width;
                    Thickness := Item.Thickness;
                    "End Condition" := Item."End Condition";
                    "Outer Diameter" := Item.OuterDia;
                    // GSTSetup.RESET;
                    // GSTSetup.SETRANGE("GST Group Code",Item."GST Group Code");
                    // GSTSetup.SETRANGE("GST Component Code",'IGST');
                    // IF GSTSetup.FINDFIRST THEN
                    // "GST %" := GSTSetup."GST Component %";
                    "Item Category Code" := Item."Item Category Code";
                    //"Product Group Code" := Item."Product Group Code"; NotAvailable-inBC
                    "No. of Batches" := 1;
                    Size := Item.Size;
                END ELSE
                    IF "Option Type" = "Option Type"::"Fixed Asset" THEN BEGIN
                        FixedAsset.GET("No.");
                        Description := FixedAsset.Description;
                    END;
            END;

        }
        field(7; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Unit of Measure Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Grade; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,YST-210,YST-240,YST-310,YST-355,T-12,C-06,C-10,G-05,G15';
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
        }
        field(10; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Length; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Reason; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "End Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Plane End,Bevel End,SWS,SS';
            OptionMembers = " ","Plane End","Bevel End",SWS,SS;
        }
        field(15; Stamp; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,APL Appollo, Green,Without Stamp';
            OptionMembers = " ","APL Appollo",Green,"Without Stamp";
        }
        field(16; "Outer Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "IS Specification"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,IS-1239, IS-3601, IS-4923, IS-1161, IS-3589, IS-9295, IS-4270,ASTMA-500,BS-1387, EN-1021';
            OptionMembers = " ","IS-1239","IS-3601","IS-4923","IS-1161","IS-3589","IS-9295","IS-4270","ASTMA-500","BS-1387","EN-1021";
        }
        field(18; "Qty. per Unit of Measure"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Inner Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Job Work Location"; Code[20])
        {
            TableRelation = Location;
            DataClassification = ToBeClassified;
        }
        field(21; "No. of Bundle"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Alternate UOM"; Code[10])
        {
            TableRelation = "Unit of Measure";
            DataClassification = ToBeClassified;
        }
        field(23; Size; Code[10])
        {
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // VAR
            //   SizeLoc@1000000000 : Record 50016;
            // BEGIN
            //   SizeLoc.RESET;
            //   SizeLoc.SETRANGE("Default Code",'SIZE');
            //   SizeLoc.SETRANGE("Default Code Value",Size);
            //   IF NOT SizeLoc.FINDFIRST THEN
            //     ERROR(STRSUBSTNO('Value of Field Size %1 is not valid',Size));
            // END;

            // trigger OnLookup()
            // VAR
            //   SizeLoc@1000000000 : Record 50016;
            // BEGIN
            //   SizeLoc.RESET;
            //   SizeLoc.SETRANGE("Default Code",'SIZE');
            //   IF SizeLoc.FINDSET THEN
            //   IF PAGE.RUNMODAL(50024,SizeLoc) = ACTION::LookupOK THEN
            //     VALIDATE(Size,SizeLoc."Default Code Value");
            // END;
        }
        field(24; "Surface Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Varnished,Self Colour,Voild';
            OptionMembers = " ",Varnished,"Self Colour",Voild;
        }
        field(25; "Alternate Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26; Width; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Item Classification"; Code[20])
        {
            TableRelation = "Item Classification"."Item Classification Type" WHERE ("Item Category Code" = FIELD ("Item Category Code"));
            DataClassification = ToBeClassified;
        }
        field(28; "Pcs/Bundle"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Item Category Code"; Code[10])
        {
            TableRelation = "Item Category";
            DataClassification = ToBeClassified;
        }
        field(30; "Product Group Code"; Code[10])
        {
            TableRelation = "Product Group".Code WHERE ("Item Category Code" = FIELD ("Item Category Code"));
            DataClassification = ToBeClassified;
        }
        field(31; "No. of Batches"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Reason Code"; Code[20])
        {
            TableRelation = "Reason Code".Code;
            DataClassification = ToBeClassified;
        }
        field(33; "Posted RGP Line"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Posted Gate Entry No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "GST %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Posted RGP Document"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Posted Gate Entry Inward"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Qty. To Receive"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Qty. Received"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
    KEYS
    {
        key(PrimaryKey; "Document Type", Type, "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    VAR
        Item: Record Item;
        FixedAsset: Record "Fixed Asset";
        UOMMgt: Codeunit 5402;
        //SizeLoc : Record 50016;

        //WillUnlock after TABEL 50100 will be added
        // PROCEDURE AssignLotlNumber()
        // VAR
        //   LocT50100 : Record 50100;
        // BEGIN
        //   TESTFIELD("No.");
        //   TESTFIELD(Quantity);
        //   LocT50100.GET("Document Type",Type,"Document No.");
        //   LocT50100.TESTFIELD("Posting Date");
        //   IF Type = Type::Normal THEN ///Pru_gk
        //   LocT50100.TESTFIELD("From Location");
        //   CallItemTracking(Rec);
        // END;

    PROCEDURE CallItemTracking(VAR RecRGPLine: Record "RGP/NRGP Line");
    VAR
        TrackingSpecification: Record "Tracking Specification";
        ItemTrackingPage: Page "Item Tracking Lines";
        ItemJnlLine: Record "Item Journal Line";
        LocT50001: Record "RGP/NRGP Header";
    BEGIN
        ItemTracking(RecRGPLine, TrackingSpecification);
        ItemTrackingPage.SetFormRunMode(1);
        LocT50001.GET(RecRGPLine."Document Type", RecRGPLine.Type, RecRGPLine."Document No.");
        ItemTrackingPage.SetSourceSpec(TrackingSpecification, LocT50001."Posting Date");
        ItemTrackingPage.SetInbound(ItemJnlLine.IsInbound);
        ItemTrackingPage.RUNMODAL;
    END;

    PROCEDURE ItemTracking(VAR LocRGPLine: Record "RGP/NRGP Line"; VAR TrackingSpecification: Record "Tracking Specification");
    VAR
        InvSetup: Record "Manufacturing Setup";
        LocT50001: Record "RGP/NRGP Header";
    BEGIN
        LocT50001.GET(LocRGPLine."Document Type", LocRGPLine.Type, LocRGPLine."Document No.");
        IF LocRGPLine."Document Type" = LocRGPLine."Document Type"::RGP THEN BEGIN
            InvSetup.GET;
            IF LocRGPLine.Quantity > 0 THEN BEGIN
                TrackingSpecification.INIT;
                TrackingSpecification."Source Type" := DATABASE::"Item Journal Line";
                TrackingSpecification."Item No." := LocRGPLine."No.";
                IF Type = Type::Normal THEN BEGIN
                    TrackingSpecification."Location Code" := LocT50001."From Location";
                    TrackingSpecification."Source Subtype" := TrackingSpecification."Source Subtype"::"4";
                    TrackingSpecification."Source ID" := LocRGPLine."Document No.";
                    TrackingSpecification."Source Batch Name" := 'DEFAULT';
                END ELSE BEGIN
                    TrackingSpecification."Location Code" := LocT50001."Job Work Location";
                    TrackingSpecification."Source Subtype" := TrackingSpecification."Source Subtype"::"2";
                    TrackingSpecification."Source ID" := LocRGPLine."Document No.";
                    TrackingSpecification."Source Batch Name" := 'DEFAULT';
                END;
                TrackingSpecification."Source Prod. Order Line" := 0;
                TrackingSpecification."Source Ref. No." := LocRGPLine."Line No.";
                TrackingSpecification."Quantity (Base)" := LocRGPLine.Quantity * LocRGPLine."Qty. per Unit of Measure";
                TrackingSpecification."Qty. to Handle" := LocRGPLine.Quantity * LocRGPLine."Qty. per Unit of Measure";
                TrackingSpecification."Qty. to Handle (Base)" := LocRGPLine.Quantity * LocRGPLine."Qty. per Unit of Measure";
                TrackingSpecification."Qty. to Invoice" := LocRGPLine.Quantity * LocRGPLine."Qty. per Unit of Measure";
                TrackingSpecification."Qty. to Invoice (Base)" := LocRGPLine.Quantity * LocRGPLine."Qty. per Unit of Measure";
                TrackingSpecification."Quantity Handled (Base)" := 0;
                TrackingSpecification."Quantity Invoiced (Base)" := 0;
                TrackingSpecification."Qty. per Unit of Measure" := LocRGPLine."Qty. per Unit of Measure";
                TrackingSpecification.Correction := FALSE;
            END;
        END ELSE BEGIN
            InvSetup.GET;
            IF LocRGPLine.Quantity > 0 THEN BEGIN
                TrackingSpecification.INIT;
                TrackingSpecification."Source Type" := DATABASE::"Item Journal Line";
                TrackingSpecification."Item No." := LocRGPLine."No.";
                TrackingSpecification."Location Code" := LocT50001."From Location";
                TrackingSpecification."Source Subtype" := TrackingSpecification."Source Subtype"::"3";
                TrackingSpecification."Source ID" := LocRGPLine."Document No.";
                TrackingSpecification."Source Batch Name" := 'DEFAULT';
                TrackingSpecification."Source Prod. Order Line" := 0;
                TrackingSpecification."Source Ref. No." := LocRGPLine."Line No.";
                TrackingSpecification."Quantity (Base)" := LocRGPLine.Quantity * LocRGPLine."Qty. per Unit of Measure";
                TrackingSpecification."Qty. to Handle" := LocRGPLine.Quantity * LocRGPLine."Qty. per Unit of Measure";
                TrackingSpecification."Qty. to Handle (Base)" := LocRGPLine.Quantity * LocRGPLine."Qty. per Unit of Measure";
                TrackingSpecification."Qty. to Invoice" := LocRGPLine.Quantity * LocRGPLine."Qty. per Unit of Measure";
                TrackingSpecification."Qty. to Invoice (Base)" := LocRGPLine.Quantity * LocRGPLine."Qty. per Unit of Measure";
                TrackingSpecification."Quantity Handled (Base)" := 0;
                TrackingSpecification."Quantity Invoiced (Base)" := 0;
                TrackingSpecification."Qty. per Unit of Measure" := LocRGPLine."Qty. per Unit of Measure";
            END;
        END;
    END;
}
