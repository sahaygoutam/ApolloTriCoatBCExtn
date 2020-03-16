tableextension 50111 SalesHeaderExt extends "Sales Header"
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
        field(50103; "Port of Discharge"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Place of Recpt.of Pre Carrier"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Port of Loading"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50106; "Final Destination"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Marks And No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Container No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50109; "No And Kind of Packages"; Text[50])
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
        field(50112; "Licence Duty Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "Sales Order Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Distributor,SEZ,Export,Dealer,Institutional,"Deemed Export","Job Work","Scrap Sale","Stock Transfer";
            trigger OnValidate()
            var
                T14_Loc: Record Location;
                SalesLine: Record "Sales Line";
                GLAccount: Record "G/L Account";
            begin
                IF "Sales Order Type" = "Sales Order Type"::"Job Work" THEN BEGIN
                    T14_Loc.RESET;
                    T14_Loc.SETRANGE(T14_Loc."Inward Jobwork Location", TRUE);
                    IF T14_Loc.FINDFIRST THEN
                        VALIDATE("Location Code", T14_Loc.Code);
                END;
                IF "Sales Order Type" = "Sales Order Type"::"Job Work" THEN BEGIN
                    IF "Document Type" = "Document Type"::Order THEN BEGIN
                        SalesLine.INIT;
                        SalesLine."Document Type" := "Document Type";
                        SalesLine."Document No." := "No.";
                        SalesLine."Line No." := 10000;
                        SalesLine.Type := SalesLine.Type::"G/L Account";
                        GLAccount.RESET;
                        GLAccount.SETFILTER("Inward Service G/L", '%1', TRUE);
                        IF GLAccount.FINDFIRST THEN
                            SalesLine.VALIDATE("No.", GLAccount."No.");
                        SalesLine.INSERT;
                    END;
                END;
            end;
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
            OptionMembers = " ",FOB,CIF,Ex,FOR;
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
            trigger OnValidate()
            var
                ItemCategoryList: Page "Item Categories";
                ItemCategory: Record "Item Category";
            begin
                ItemCategoryList.LOOKUPMODE(TRUE);
                ItemCategoryList.SETTABLEVIEW(ItemCategory);
                IF ItemCategoryList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                    ItemCategoryList.GETRECORD(ItemCategory);
                    "Order Category Type" := ItemCategoryList.GetSelectionFilter;
                    EXIT;
                END;
            end;
        }
    }
}