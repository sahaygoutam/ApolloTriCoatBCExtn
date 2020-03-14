table 50127 "Packing Details"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Sales Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Sales Order Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Bundle; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "Pcs/Bundle" <> 0 THEN
                    "Total Bundle" := (Bundle * "Pcs/Bundle")
                ELSE
                    "Total Bundle" := Bundle;
            end;
        }
        field(5; "Pcs/Bundle"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF Bundle <> 0 THEN
                    "Total Bundle" := (Bundle * "Pcs/Bundle")
                ELSE
                    "Total Bundle" := "Pcs/Bundle";

                "Total Pcs" := Bundle * "Pcs/Bundle";
            end;
        }
        field(6; Weight; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Sales Shipment No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Total Bundle"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Total Pcs"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Sales Invoice No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Sales Invoice Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Sales Order No.", "Sales Order Line No.", "Line No.")
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

}