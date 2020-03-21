table 50122 "Subcontracting RPO"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(4; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Description for RPO"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(7; "End Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Subcontracting RGP No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(10; "Subcontracting RGP Line No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(11; "Variant Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
    }

    keys
    {
        key(PK; "Item No.", "Variant Code", "Subcontracting RGP No.", "Subcontracting RGP Line No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure CreateRPO(VAR RelSub: Record "Subcontracting RPO")
    var
        myInt: Integer;
    begin
        IF RelSub.FINDSET THEN
            REPEAT
                InsertProdOrder(RelSub);
            UNTIL RelSub.NEXT = 0;
    end;

    local procedure InsertProdOrder(VAR ParaRPO: Record "Subcontracting RPO")
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
}