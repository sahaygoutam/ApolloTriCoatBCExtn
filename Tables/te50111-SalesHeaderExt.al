tableextension 50111 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(50000; "Pre Carriage"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Vessel No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Flight No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Port of Discharge"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Place of Recpt.of Pre Carrier"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Port of Loading"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Final Destination"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Marks And No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Container No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "No And Kind of Packages"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Net Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Licence Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Licence Duty Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Sales Order Type"; Option)
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
                        //                        GLAccount.SETFILTER("Inward Service G/L", '%1', TRUE);
                        IF GLAccount.FINDFIRST THEN
                            SalesLine.VALIDATE("No.", GLAccount."No.");
                        SalesLine.INSERT;
                    END;
                END;
            end;
        }
        field(50014; "Distributor Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Commision %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "Inco terms"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",FOB,CIF,Ex,FOR;
        }
        field(50017; Distributor; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "PO Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Country of Origin of Goods"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Country of Final Destination"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Description of Goods"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Subcontracting RGP No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50023; Freight; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","To Bill","To Pay";
        }
        field(50024; "Amt. to Customer"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Shipping Bill No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50026; "Shipping Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50027; "LUT No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50028; "Order Category Type"; Text[50])
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