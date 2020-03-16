tableextension 50104 InventorySetupExt extends "Inventory Setup"
{
    fields
    {
        field(50101; "Issue Slip Nos."; Code[20]) { }
        field(50102; "Indent Batch Name"; Code[20]) { }
        field(50103; "Auto Consumption Batch Name"; Code[20]) { }
        field(50104; "Stock Report Start Time"; Time) { }
        field(50105; "Stock Report End Time"; Time) { }
    }
}