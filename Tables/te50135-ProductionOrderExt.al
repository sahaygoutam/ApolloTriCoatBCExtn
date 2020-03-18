tableextension 50135 ProductionOrderExt extends "Production Order"
{
    fields
    {
        field(50100; Subcontracting; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50101; "Subcontracting RGP No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Subcontracting RGP Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Subcontracting Sales Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Production Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ";
        }
        field(50105; "Remaining Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}