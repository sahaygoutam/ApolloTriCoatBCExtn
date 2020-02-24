table 50114 "Freight Master"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Vendor Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Vehicle Capacity"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnLookup()
            begin
                VehicleLoc.RESET;
                VehicleLoc.SETRANGE("Default Code", 'VEHCAPACITY');
                VehicleLoc.SETRANGE("Default Decimal Value", "Vehicle Capacity");
                IF NOT VehicleLoc.FINDFIRST THEN
                    ERROR(STRSUBSTNO('Value of Field Vehicle Capacity %1 is not valid', "Vehicle Capacity"));
            end;

            trigger OnValidate()
            begin
                VehicleLoc.RESET;
                VehicleLoc.SETRANGE("Default Code", 'VEHCAPACITY');
                IF VehicleLoc.FINDSET THEN
                    IF PAGE.RUNMODAL(50025, VehicleLoc) = ACTION::LookupOK THEN
                        VALIDATE("Vehicle Capacity", VehicleLoc."Default Decimal Value");
            END;
        }
        field(3; "From City"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "To City"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "From date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                FreightMaster_Rec: Record "Freight Master";
            begin
                FreightMaster_Rec.RESET;
                FreightMaster_Rec.SETRANGE("From City", "From City");
                FreightMaster_Rec.SETRANGE("To City", "To City");
                FreightMaster_Rec.SETRANGE("Vendor Number", "Vendor Number");
                FreightMaster_Rec.SETRANGE("To date", 0D);
                IF FreightMaster_Rec.FINDFIRST THEN BEGIN
                    IF FreightMaster_Rec."From date" < "From date" THEN BEGIN
                        FreightMaster_Rec."To date" := CALCDATE('-1D', "From date");
                        FreightMaster_Rec.MODIFY;
                    END;
                END;
            END;
        }
        field(6; "To date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Price Per Ton"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Vendor Number", "From City", "To City", "From date", "Vehicle Capacity")
        {
            Clustered = true;
        }
    }


    var
        VehicleLoc: Record "Master Setup";
}