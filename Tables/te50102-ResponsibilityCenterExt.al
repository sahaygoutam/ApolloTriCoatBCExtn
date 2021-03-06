tableextension 50102 ResponsibilityCenterExt extends "Responsibility Center"
{
    fields
    {
        field(50100; "Quote Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50101; "Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Sales Shipment Header" = R;
        }
        field(50102; "Invoice Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50103; "Posted Invoice Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50104; "Credit Memo Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50105; "Posted Credit Memo Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50106; "Posted Shipment Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50107; "Reminder Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50108; "Issued Reminder Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50109; "Fin. Chrg. Memo Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50110; "Issued Fin. Chrg. M. Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50111; "Posted Prepmt. Inv. Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50112; "Posted Prepmt. Cr. Memo Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50113; "Blanket Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50114; "Direct Debit Mandate Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50115; "Posted Return Receipt Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Return Receipt Header" = R;
        }
        field(50116; "Return Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Return Receipt Header" = R;
        }
        field(50117; "Third Party Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50118; "Posted Invoice Nos. (Trading)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50119; "Posted Ret Rcpt Nos. (Trading)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50121; "Posted Sales Shpt. (Trading)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50122; "Posted Sale Cr. Memo (Trading)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50123; "Posted Inv. Nos. (Exempt)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50124; "Posted Cr. Memo Nos. (Exempt)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50125; "Posted Inv. No. (Export)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50126; "Posted Cr. Memo No. (Export)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50127; "Posted Inv. No. (Supp)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50128; "Posted Cr. Memo No. (Supp)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50129; "Posted Inv. No. (Debit Note)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50130; "Posted Inv. No. (Non-GST)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50131; "Posted Cr. Memo No. (Non-GST)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50132; "Purch. Quote Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50133; "Purch. Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
        }
        field(50134; "Purch. Invoice Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50135; "Posted Purch. Invoice Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50136; "Purch. Credit Memo Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50137; "Posted Purch. Credit Memo Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50138; "Posted Purch. Receipt Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
        }
        field(50139; "Blanket Purch. Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
        }
        field(50140; "Posted Purch.Prepmt. Inv. Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50141; "Posted P.Prepmt. Cr. Memo Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50142; "Posted Purch.Return Shpt. Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Return Shipment Header" = R;
        }
        field(50143; "Purch. Return Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Return Shipment Header" = R;
        }
        field(50144; "Purch. Third Party Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50145; "Posted Delivery Challan Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50146; "Subcontracting Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50147; "Posted SC Comp. Rcpt. Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50148; "Delivery Challan Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50149; "Posted PInvoice Nos. (Trading)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50150; "Posted PRet Shpt Nos.(Trading)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50151; "Posted Purch. Rcpt. (Trading)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50152; "Posted Purch Cr. Memo(Trading)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50153; "Multiple Subcon. Order Det Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50154; "Posted Purch. Inv.(Unreg)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50155; "Posted Purch Cr. Memo(Unreg)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50156; "Posted Purch Inv.(Unreg Supp)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50157; "Pst. Pur. Inv(Unreg. Deb.Note)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50158; "RM Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50159; "Consumable Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50160; "Service Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50161; "Import Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50162; "RM Blanket Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50163; "Consumable Blanket Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50164; "Service Blanket Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50165; "Import Blanket Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50166; "QC Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50167; "Simulated Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50168; "Planned Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50169; "Firm Planned Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50170; "Released Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50171; "Work Center Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Machine Center" = R;
        }
        field(50172; "Machine Center Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Machine Center" = R;
        }
        field(50173; "Routing Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Calendar Absence Entry" = R;
        }
        field(50174; "Transfer Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Transfer Header" = R;
        }
        field(50175; "Posted Transfer Shpt. Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Transfer Header" = R;
        }
        field(50176; "Posted Transfer Rcpt. Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Transfer Header" = R;
        }
        field(50177; "Nonstock Item Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Nonstock Item" = R;
        }
        field(50178; "Inventory Put-away Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Posted Invt. Put-away Header" = R;
        }
        field(50179; "Inventory Pick Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Posted Invt. Pick Header" = R;
        }
        field(50180; "Posted Invt. Put-away Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Posted Invt. Put-away Header" = R;
        }
        field(50181; "Posted Invt. Pick Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Posted Invt. Pick Header" = R;
        }
        field(50182; "Inventory Movement Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Whse. Internal Put-away Header" = R;
        }
        field(50183; "Registered Invt. Movement Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Whse. Internal Put-away Header" = R;
        }
        field(50184; "Internal Movement Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            AccessByPermission = TableData "Whse. Internal Put-away Header" = R;
        }
        field(50185; "Third Party Nos.(Inventory)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50186; "Inward Gate Entry Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50187; "Outward Gate Entry Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50188; "Posted Shpt. Nos. (Captive)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50189; "Transfer Order Nos. (Captive)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50190; "Service Transfer Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50191; "Posted Serv. Trans. Shpt. Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50192; "Posted Serv. Trans. Rcpt. Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50193; "RGP Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50194; "NRGP Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50195; "Subcon RGP Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50196; "Indent No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50197; "QC Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50198; "Issue Slip Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50199; "Rolling Plan No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

}