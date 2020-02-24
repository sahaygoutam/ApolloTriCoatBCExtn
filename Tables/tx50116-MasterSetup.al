table 50116 "Master Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Default Code"; Code[20]) { }
        field(2; "Default Code Value"; Code[20]) { }
        field(3; "Default Decimal Value"; Decimal) { }
        field(4; "Default Text Value"; Text[50]) { }
        field(5; "Default Text Value1"; Text[50]) { }
        field(6; "Default Boolean Value"; Boolean) { }
    }

    keys
    {
        key(PK; "Default Code", "Default Code Value", "Default Decimal Value")
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