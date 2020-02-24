table 50112 "Turn Over Discount"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(2; "Starting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        field(5; "Sale Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Sale Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Discount%"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Unit of Measure"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
    }

    keys
    {
        key(PK; "Customer No.", "Starting Date", "Ending Date", "Item No.", "Sale Quantity", "Sale Amount", "Discount%")
        {
            Clustered = true;
        }
    }
}