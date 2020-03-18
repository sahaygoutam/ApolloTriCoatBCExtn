tableextension 50134 ReservationEntryExt extends "Reservation Entry"
{
    fields
    {
        field(50100; "Number of Coils"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Vendor Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Rejected Location"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}