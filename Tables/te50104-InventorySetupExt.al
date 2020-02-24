tableextension 50104 InventorySetupExt extends "Inventory Setup"
{
    fields
    {
        field(50001; "Issue Slip Nos."; Code[20]) { }
        field(50002; "Indent Batch Name"; Code[20]) { }
        field(50003; "Auto Consumption Batch Name"; Code[20]) { }
        field(50004; "Stock Report Start Time"; Time) { }
        field(50005; "Stock Report End Time"; Time) { }
    }

    var
        myInt: Integer;
}