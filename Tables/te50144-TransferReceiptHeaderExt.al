tableextension 50144 TransferReceiptHeaderExt extends "Transfer Receipt Header"
{
    fields
    {
        field(50100; "Posted Gate Outword No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Posted Gate Inword No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}