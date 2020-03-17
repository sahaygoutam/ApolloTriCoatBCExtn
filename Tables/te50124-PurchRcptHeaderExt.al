tableextension 50124 PurchRcptHeaderExt extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50100; "Order Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",RM,Consumable,Service,"Import and Capital Order";
        }
        field(50101; "Inco terms"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",EX,FOR,CIF;
        }
        field(50102; Transporter; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Posted Gate Entry No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Shortcut Dimension 8 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (8), Blocked = CONST (false));
        }
        field(50106; Project; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Total Qty. to Send"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Company Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(50109; "Vendor Location"; Code[20])
        {
            FieldClass = FlowField;
            //            CalcFormula = Lookup(Vendor."Vendor Location" WHERE ("No."=FIELD("Buy-from Vendor No.")));
        }
        field(50110; "One Send Multi Receive"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Send Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        field(50112; "Lot No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "INR Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50114; "Copy Document"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}