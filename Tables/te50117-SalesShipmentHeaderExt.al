tableextension 50117 SalesShipmentHeaderExt extends "Sales Shipment Header"
{
    fields
    {
        field(50100; "Pre Carriage"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Vessel No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Flight No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Port of Discharge"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Place of Recpt.of Pre Carrier"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Port of Loading"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50106; "Final Destination"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Marks& No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Container No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50109; "No& Kind of Packages"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Net Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Licence Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Licence Duty value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "Sales Order type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Distributor,SEZ,Export,Dealer,Institutional,"Deemed Export","Job Work","Scrap Sale","Stock Transfer";
        }
        field(50114; "Distributor Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50115; "Commision %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50116; "Inco terms"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,FOB,CIF,Ex,FOR;
        }
        field(50117; Distributor; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50118; "PO Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50119; "Country of Origin of Goods"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50120; "Country of Final Destination"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50121; "Description of Goods"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50122; "Subcontracting RGP No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50123; Freight; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","To Bill","To Pay";
        }
        field(50124; "Amt. to Customer"; Decimal)
        {
            DataClassification = ToBeClassified;
            AutoFormatExpression = "Currency Code";
            Editable = false;
        }
        field(50125; "Shipping Bill No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50126; "Shipping Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50127; "LUT No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50128; "Order Category Type"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }
}