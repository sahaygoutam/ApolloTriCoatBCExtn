table 50115 "Item Classification"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item Category Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code;
        }
        field(2; "Product Group Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Product Group".Code where ("Item Category Code" = field ("Item Category Code"));
        }
        field(3; "Item Classification Type"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Item Category Code", "Product Group Code", "Item Classification Type")
        {
            Clustered = true;
        }
        key(PK1; Description) { }
        key(PK2; "Item Classification Type") { }
        key(PK3; "Product Group Code") { }
    }
}