table 50106 "Indent Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF Type = Type::" " THEN
                    ERROR('First select type');
                IF Type = Type::Item THEN BEGIN
                    //>>
                    IndentLine1.RESET;
                    IndentLine1.SETRANGE(IndentLine1."Document No.", "Document No.");
                    IndentLine1.SETRANGE("No.", "No.");
                    IF IndentLine1.FINDFIRST THEN
                        ERROR(STRSUBSTNO('Item %1 can not be used again', "No."));
                    //<<

                    Item.GET("No.");
                    Description := Item.Description;
                    "Item Category Code" := Item."Item Category Code";
                    Width := Item.Width;
                    Thickness := Item.Thickness;
                    "Unit of Measure Code" := Item."Base Unit of Measure";
                    "Approx Cost" := Item."Last Direct Cost";
                    IF "Item Category Code" = 'CA' THEN
                        "Capital Items" := TRUE
                    ELSE
                        "Capital Items" := FALSE;
                END ELSE
                    IF Type = Type::"Fixed Asset" THEN BEGIN
                        FA.GET("No.");
                        Description := FA.Description;
                        "Capital Items" := TRUE;
                    END;
                TESTFIELD(Status, Status::Open);

                IndentHeader1.GET("Document No.");
                "Indent Date" := IndentHeader1."Indent Date";
                IF Type = Type::Item THEN
                    CodeunitIL.CalculateStockInv(Rec);
            end;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Description 2"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; UOM; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Expected Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Close;
        }
        field(11; "Technical Specification"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "PO Approve Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "PO Received Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Approved,Closed,Rejected,"Pending Approval",Issued;
        }
        field(15; Location; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                TESTFIELD(Status, Status::Open);
                TESTFIELD("No.");
                Indentheader.GET("Document No.");
                Indentheader.TESTFIELD(Indentheader.Status, Indentheader.Status::Open);
            end;
        }
        field(16; "Vendor Exist"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Multi Vendor Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Approved;
        }
        field(18; "Unit of Measure Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Variant Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Approval User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Indent Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "No. of PO"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Stock In Hand"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Item,"Fixed Asset";
        }
        field(25; "Remaining Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IndentHeader.RESET;
                IndentHeader.SETRANGE("Indent No.", "Document No.");
                IF IndentHeader.FINDFIRST THEN BEGIN
                    IF "Due Date" < IndentHeader."Indent Date" THEN
                        ERROR('Due Date cannot be less than Indent Date');
                END;
            end;
        }
        field(27; "Approx Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Internal Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Approved Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Batch Creation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Reason Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Item Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "From Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                TESTFIELD(Status, Status::Open);
                TESTFIELD("No.");
                Indentheader.GET("Document No.");
                Indentheader.TESTFIELD(Indentheader.Status, Indentheader.Status::Open);
            end;
        }
        field(36; "Chicks Item"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(37; Grade; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05","G15";
        }
        field(38; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(39; Width; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Released Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Released,Cancel,Close,"Pending Approval";
        }
        field(41; "User Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Capital Items"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Completely Received"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Shortcut Dimension 1 Code"; Code[10])
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
        Item: Record Item;
        Vendor: Record Vendor;
        Usersetup: Record "User Setup";
        IndentHeader: Record "Indent Header";
        ILE: Record "Item Ledger Entry";
        SafetyStock: Decimal;
        QtyonPurchOrder: Decimal;
        QtyOnProdOrder: Decimal;
        "Lead Time": DateFormula;
        FA: Record "Fixed Asset";
        IndentLine: Record "RGP/NRGP Header";
        IndentHeader1: Record "Indent Header";
        userset: Record "User Setup";
        CodeunitIL: Codeunit "Issue Slip validate";
        IndentLine1: Record "Indent Line";

    trigger OnInsert()
    begin
        IndentLine1.RESET;
        IndentLine1.SETRANGE(IndentLine1."Document No.", "Document No.");
        IndentLine1.SETRANGE(IndentLine1.Type, IndentLine1.Type::Item);
        IndentLine1.SETRANGE("No.", "No.");
        IF IndentLine1.FINDFIRST THEN
            ERROR(STRSUBSTNO('Item %1 can not be used again', "No."));
    end;
}