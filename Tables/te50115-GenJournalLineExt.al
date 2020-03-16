tableextension 50115 GenJournalLineExt extends "Gen. Journal Line"
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
        field(50102; "Transaction No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Date of Issue"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Loan Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Tenure Days"; DateFormula)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                TESTFIELD("Date of Issue");
                "Loan Due Date" := CALCDATE("Tenure Days", "Date of Issue");
            end;
        }
        field(50106; "Rate of Interest"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "No. of Installments"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Advance Payment FA"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50109; "Loan No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Premium Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Loan Bank Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Loan Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "Loan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Payment,Receive;
            trigger OnValidate()
            begin
                "Loan Amount" := Amount;
            end;
        }
        field(50114; LC; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50115; BG; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(51016; "BG No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50117; "LC/BG"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",L,CBG;
        }
        field(50118; "Available Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50119; "Issue Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50120; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50121; "TDR No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50122; "TDR Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "TDR Amount" > 0 THEN BEGIN
                    "Debit Amount" := "TDR Amount";
                    Amount := "TDR Amount";
                END;
                IF "TDR Amount" < 0 THEN BEGIN
                    "Credit Amount" := "TDR Amount";
                    Amount := -"TDR Amount";
                END;
            end;
        }
    }
}