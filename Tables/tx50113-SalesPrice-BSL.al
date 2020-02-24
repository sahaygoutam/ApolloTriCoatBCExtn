table 50113 "Sales Price-BSL"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item Classification Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Size; Code[20])
        {
            DataClassification = ToBeClassified;
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
                SizeLoc.RESET;
                SizeLoc.SETRANGE("Default Code", 'SIZE');
                IF SizeLoc.FINDSET THEN
                    IF PAGE.RUNMODAL(50124, SizeLoc) = ACTION::LookupOK THEN
                        VALIDATE(Size, SizeLoc."Default Code Value");
            end;
        }
        field(3; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; UOM; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "End Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Plain End","Bevel End",SWS,SS;
        }
        field(10; "Product Group Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; LMH; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Light,Medium,Heavy;
        }
        field(12; "Branch Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; State; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Inco Terms"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",FOB,CIF,Ex,FOR;
        }
        field(15; Length; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Customer Price Group"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(17; Grade; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
        }
    }

    keys
    {
        key(PK; "Item Classification Type", Size, "End Condition", "Product Group Code", LMH, "Branch Code", "Start Date", "Currency Code", UOM, Thickness, Length, "Customer Price Group", Grade)
        {
            Clustered = true;
        }
    }

    var
        SizeLoc: Record "Master Setup";
}