tableextension 50103 GeneralLedgerSetupExt extends "General Ledger Setup"
{
    fields
    {
        field(50100; "Indent No. Series"; Code[10]) { }
        field(50101; "QC Nos."; Code[20]) { }
        field(50102; "SMS Sender ID"; Code[10]) { }
        field(50103; "SMS Start Time"; Time) { }
    }
}