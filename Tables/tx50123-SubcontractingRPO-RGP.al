table 50123 "Subcontracting RPO-RGP"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Quote,Order,Invoice,"Credit Memo","Blanket Order","Return Order",Planning;
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
            trigger OnValidate()
            var
                ManufacturingSetup: Record "Manufacturing Setup";
            begin
                IF Recitem.GET("Item No.") THEN BEGIN
                    VALIDATE("Unit of Measure Code", Recitem."Base Unit of Measure");
                    VALIDATE("Order Thickness", Recitem.Thickness);
                    VALIDATE("Rolling Thickness", Recitem.Thickness);
                    VALIDATE(Length, Recitem.Length);
                    VALIDATE(OD, Recitem.OuterDia);
                    VALIDATE("IS Specs", Recitem."IS Specifications");
                    VALIDATE(Stamp, Recitem.Stamp);
                    VALIDATE(Size, Recitem.Size);
                    "Item Category Code" := 'SFG';
                END;

                SalesHeader.RESET;
                SalesHeader.SETRANGE("No.", "Document No.");
                IF SalesHeader.FINDFIRST THEN
                    "Location Code" := SalesHeader."Location Code";

                IF Recitem."Scrap Item" THEN BEGIN
                    ManufacturingSetup.GET;
                    "Location Code" := ManufacturingSetup."Scrap Location";
                    "Qty. to Ship" := Quantity;
                END;
            end;
        }
        field(5; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(6; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Recitem.GET("Item No.");
                IF Recitem."Scrap Item" THEN BEGIN
                    IF "Posted Scrap" = FALSE THEN
                        "Qty. to Ship" := Quantity
                    ELSE
                        ERROR('Scrap Item Already Posted');
                END;
            end;
        }
        field(7; "Description for RPO"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(9; "End Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(10; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(11; "Subcontracting RGP No."; Code[20])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup ("RGP/NRGP Header"."No." WHERE ("Document Type" = CONST (RGP), Type = CONST (Subcontracting), "External Document No." = FIELD ("Document No.")));
        }
        field(12; "Variant Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(13; "RPO No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(14; "Qty. to Ship"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(15; "Quantity Shipped"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(16; "Unit of Measure Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(17; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code", "Dimension Set ID");
            end;
        }
        field(18; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code", "Dimension Set ID");
            end;
        }
        field(19; Status; Option)
        {
            OptionMembers = Simulated,Planned,"Firm Planned",Released,Finished;
            FieldClass = FlowField;
            CalcFormula = Lookup ("Production Order".Status WHERE ("No." = FIELD ("RPO No.")));
        }
        field(20; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(21; Customer; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(22; "Order Thickness"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(23; Length; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(24; Grade; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
        }
        field(25; OD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(26; "IS Specs"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","IS-1239","IS-3601","IS-4923","IS-1161","IS-3589","IS-9295","IS-4270","ASTMA-500","BS-1387","EN-1021";
        }
        field(27; Stamp; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","APL Apollo",Green,"Without Stamp";
        }
        field(28; Size; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                SizeLoc.RESET;
                SizeLoc.SETRANGE("Default Code", 'SIZE');
                SizeLoc.SETRANGE("Default Code Value", Size);
                IF NOT SizeLoc.FINDFIRST THEN
                    ERROR(STRSUBSTNO('Value of Field Size %1 is not valid', Size));
            end;

            trigger OnLookup()
            begin
                IF Size = '' THEN BEGIN
                    SizeLoc.RESET;
                    SizeLoc.SETRANGE("Default Code", 'SIZE');
                    IF SizeLoc.FINDSET THEN
                        IF PAGE.RUNMODAL(50024, SizeLoc) = ACTION::LookupOK THEN
                            VALIDATE(Size, SizeLoc."Default Code Value");
                END;
            end;
        }
        field(29; ID; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(30; "End Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Plane End","Bevel End",SWS,SS;
        }
        field(31; "Surface Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Varnished,"Self Colour",Voild;
        }
        field(32; "Rolling Thickness"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(33; "Item Classification"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Classification"."Item Classification Type" WHERE ("Item Category Code" = FIELD ("Item Category Code"));
        }
        field(34; "Item Category Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category";
        }
        field(35; "Product Group Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Product Group".Code WHERE ("Item Category Code" = FIELD ("Item Category Code"));
        }
        field(36; "Rolling Qty(PCS)"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(37; "KG/MTR"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(38; "Rolling Qty(MT)"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(39; "Mill Speed MTR/Min"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(40; "Mill Availability (Hrs)"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(41; "Total Slit (Nos.)"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(42; "Slit Stock (MT)"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(43; "From Slitting (MT)"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(44; Width; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(45; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(46; "Posted Scrap"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
    }


    keys
    {
        key(PK; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        DimMgt: Codeunit DimensionManagement;
        Recitem: Record Item;
        SalesHeader: Record "Sales Header";
        MfgSetup: Record "Responsibility Center";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        MfgRecSetup: Record "Manufacturing Setup";
        SizeLoc: Record "Master Setup";

    trigger OnInsert()
    begin
        UserSetup.GET(USERID);
        UserSetup.TESTFIELD("Responsibility Center");
        "Shortcut Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
        MfgSetup.GET(UserSetup."Responsibility Center");
        IF "Document No." = '' THEN BEGIN
            IF "Document Type" = "Document Type"::Planning THEN
                TestNoSeries;
            NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", "Due Date", "Document No.", "No. Series");
        END;
    end;

    procedure TestNoSeries()
    begin
        UserSetup.GET(USERID);
        UserSetup.TESTFIELD("Responsibility Center");
        MfgSetup.GET(UserSetup."Responsibility Center");
        CASE Status OF
            Status::Simulated:
                MfgSetup.TESTFIELD("Rolling Plan No.");
        END;
    end;

    procedure GetNoSeriesCode(): Code[10]
    begin
        UserSetup.GET(USERID);
        UserSetup.TESTFIELD("Responsibility Center");
        MfgSetup.GET(UserSetup."Responsibility Center");
        CASE Status OF
            Status::Simulated:
                EXIT(MfgSetup."Rolling Plan No.");
        END;
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; VAR ShortcutDimCode: Code[20]; VAR DimensionSetID: Integer)
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, DimensionSetID);
    end;

    procedure InsertProdOrder(VAR ParaRPO: Record "Subcontracting RPO")
    var
        MfgSetup: Record "Manufacturing Setup";
        Item: Record Item;
        ProdOrder: Record "Production Order";
        HeaderExist: Boolean;
        ProdOrderChoise: Option;
        ProdOrderHeader: Record "Production Order";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        Item.GET(ParaRPO."Item No.");
        MfgSetup.GET;
        MfgSetup.TESTFIELD("Released Order Nos.");
        ProdOrder.INIT;
        ProdOrder.Status := ProdOrder.Status::Released;
        ProdOrder."No." := NoSeriesMgt.GetNextNo(MfgSetup."Released Order Nos.", WORKDATE, TRUE);
        ProdOrder."Starting Time" := TIME;
        ProdOrder."Ending Time" := TIME;
        ProdOrder."Starting Date" := ParaRPO."Start Date";
        ProdOrder."Ending Date" := ParaRPO."End Date";
        ProdOrder."Due Date" := ParaRPO."Due Date";

        ProdOrder."No. Series" := MfgSetup."Released Order Nos.";
        ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
        ProdOrder."Source No." := Item."No.";
        ProdOrder.VALIDATE(Description, Item.Description);
        ProdOrder."Description 2" := Item."Description 2";
        ProdOrder."Creation Date" := TODAY;
        ProdOrder."Last Date Modified" := TODAY;

        ProdOrder."Inventory Posting Group" := Item."Inventory Posting Group";
        ProdOrder."Location Code" := ParaRPO."Location Code";
        ProdOrder.Quantity := ParaRPO.Quantity;
        ProdOrder.Subcontracting := TRUE;
        ProdOrder."Creation Date" := TODAY;
        ProdOrder.INSERT;

        COMMIT;
        ProdOrderHeader.RESET;
        ProdOrderHeader.SETRANGE(Status, ProdOrder.Status::Released);
        ProdOrderHeader.SETRANGE("No.", ProdOrder."No.");
        IF ProdOrderHeader.FINDFIRST THEN
            REPORT.RUNMODAL(50111, FALSE, TRUE, ProdOrderHeader);
    end;

    procedure CreateRPO(VAR RelSub: Record "Subcontracting RPO")
    begin
        IF RelSub.FINDSET THEN
            REPEAT
                InsertProdOrder(RelSub);
            UNTIL RelSub.NEXT = 0;
    end;
}