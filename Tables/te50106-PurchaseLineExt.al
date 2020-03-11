tableextension 50106 PurchaseLineExt extends "Purchase Line"
{
    fields
    {
        field(50100; Width; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                WidthCheck(Rec);
            end;
        }
        field(50101; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                ThicknessCheck(Rec);
            end;
        }
        field(50102; Grade; Option)
        {
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
            DataClassification = ToBeClassified;
        }
        field(50103; "QTY.In-Transit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Vendor Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "BSL Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50106; "Actual Width"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Actual Thickness"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Actual Grade"; Option)
        {
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05",G15;
            DataClassification = ToBeClassified;
        }
        field(50109; "Alternate Unit of measure"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Alternate Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Indent No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Indent Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "Actual Qty."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50114; "No. of Batch"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                T50010_Loc: Record "Batch Weight Creation";
                Var_A: Integer;
                Var_B: Integer;
                I: Integer;
            begin
                CLEAR(Var_A);
                CLEAR(Var_B);
                T50010_Loc.RESET;
                T50010_Loc.SETRANGE("Order No.", "Document No.");
                T50010_Loc.SETRANGE("Line No.", "Line No.");
                T50010_Loc.SETRANGE(Posted, FALSE);
                IF T50010_Loc.FINDSET THEN
                    Var_A := T50010_Loc.COUNT;

                IF (Var_A > "No. of Batch") THEN BEGIN
                    Var_B := Var_A - "No. of Batch";
                    FOR I := 1 TO Var_B DO BEGIN
                        T50010_Loc.RESET;
                        T50010_Loc.SETRANGE("Order No.", "Document No.");
                        T50010_Loc.SETRANGE("Line No.", "Line No.");
                        T50010_Loc.SETRANGE(Posted, FALSE);
                        IF T50010_Loc.FINDLAST THEN
                            T50010_Loc.DELETE;
                    END;
                END;
            end;
        }
        field(50115; "Total Freight Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50116; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50117; Length; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50118; Stamp; Option)
        {
            OptionMembers = " ","APL Appollo",Green,"Without Stamp";
            DataClassification = ToBeClassified;
        }
        field(50119; "End Condition"; Option)
        {
            OptionMembers = " ","Plane End","Bevel End",SWS,SS;
            DataClassification = ToBeClassified;
        }
        field(50120; "Surface Condition"; Option)
        {
            OptionMembers = " ",Varnished,"Self Colour",Voild;
            DataClassification = ToBeClassified;
        }
        field(50121; Size; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50122; "IS Specifications"; Option)
        {
            OptionMembers = " ","IS-1239","IS-3601","IS-4923","IS-1161","IS-3589","IS-9295","IS-4270","ASTMA-500","BS-1387","EN-1021";
            DataClassification = ToBeClassified;
        }
        field(50123; "Outer Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50124; Bundle; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50125; "Item Classification"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50126; "Pcs/Bundle"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50127; "Inner Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50128; "Licence No."; Code[20])
        {
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // var
            //     LicenceMaster: Record "Licence Master";
            // begin
            //     LicenceMaster.RESET;
            //     LicenceMaster.SETRANGE("Licence No.", "Licence No.");
            //     IF LicenceMaster.FINDFIRST THEN BEGIN
            //         IF (LicenceMaster."Purchase Quantity" - LicenceMaster."Remaining Purchase Quantity") < "Qty. to Receive" THEN // rakesh kumar
            //             ERROR('Licence Qty Remaining is less then Applied Sales Order Shipment Qty');
            //     END;
            // end;
        }
        field(50129; "Short/Excess Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50130; "Shortcut Dimension 8 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
        field(50131; Project; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50132; "Excess Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50133; "Salvage Value %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50134; "Remaining Budget Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50135; "INR Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50136; "Short Closed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50137; "Order Type"; Option)
        {
            OptionMembers = " ",RM,Consumable,Service,Import,"Capital Order";
            DataClassification = ToBeClassified;
        }
        field(50138; "QC Enabled"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50139; "Other Charges"; Option)
        {
            OptionMembers = " ","OTHER CHARGES",FREIGHT,"PCK-FWD",LOADING;
            DataClassification = ToBeClassified;
        }
        field(50140; "Last Modify By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50141; "Excise Loading on Inventory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    var
        T_27: Record Item;

    local procedure WidthCheck(VAR ParaPurchline: Record "Purchase Line")
    begin
        IF T_27.GET(ParaPurchline."No.") THEN BEGIN
            IF ParaPurchline.Width < T_27.Width THEN
                ERROR('Widht cannot be less than %1', T_27.Width)
            ELSE
                IF ParaPurchline.Width > (T_27.Width + ((T_27.Width * T_27."Width Tolerance") / 100)) THEN
                    ERROR('Widht cannot be greater than %1', (T_27.Width + ((T_27.Width * T_27."Width Tolerance") / 100)));
        END;
    end;

    local procedure ThicknessCheck(VAR ParaPurchline: Record "Purchase Line")
    begin
        IF T_27.GET(ParaPurchline."No.") THEN BEGIN
            IF ParaPurchline.Thickness < T_27.Thickness THEN
                ERROR('Thickness cannot be less than %1', T_27.Thickness)
            ELSE
                IF ParaPurchline.Thickness > (T_27.Thickness + ((T_27.Thickness * T_27."Thickness Tolerance") / 100)) THEN
                    ERROR('Thickness cannot be greater than %1', (T_27.Thickness + ((T_27.Thickness * T_27."Thickness Tolerance") / 100)));
        END;
    end;
}