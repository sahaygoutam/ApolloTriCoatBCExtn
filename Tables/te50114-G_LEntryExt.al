tableextension 50114 G_LEntryExt extends "G/L Entry"
{
    fields
    {
        field(50100; "PDC Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "PDC Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Date of Issue"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Loan Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Tenure Days"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Rate of Interest"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50106; "No. of Installments"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Loan No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50109; "Premium Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Loan Bank Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Loan Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Loan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Payment,Receive;
        }
        field(50113; LC; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50114; BG; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50115; "BG No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50116; "LC No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50117; "Issue Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50118; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50119; "TDR No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}