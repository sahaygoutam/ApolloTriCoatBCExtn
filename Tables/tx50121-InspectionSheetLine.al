table 50121 "Inspection Sheet Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Actual value"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Document type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Purchase Receipt","Production Output";
        }
        field(5; "External QC"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Max Value"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Min value"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; Remarks; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Unit of Measure"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Unit of Measure";
        }
        field(10; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Qualitative,Quantitative;
        }
        field(11; "QC Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; Quality; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Pass,Fail;
        }
        field(13; "Reference Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Reference Document Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(16; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(17; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(18; Description; Text[50])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; "Document Type", "Document No", "Line No")
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