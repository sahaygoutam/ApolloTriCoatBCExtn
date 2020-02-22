table 50100 "User Wise Res. Center"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "User ID "; Code[50])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = User."User Name";

            trigger OnLookup()
            begin
                UserMgmt.LookupUserID("User ID ");
            end;
        }
        field(2; "Responsibility Center"; code[20])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                if "Responsibility Center" <> '' then begin
                    ResponsibilityCenter.Get("Responsibility Center");
                    "Responsibility Center Name" := ResponsibilityCenter.Name;
                    "Shortcut Dimension 1 Code" := "Responsibility Center";
                end
                else begin
                    "Responsibility Center" := '';
                    "Shortcut Dimension 1 Code" := '';
                end;
            end;
        }
        field(3; "Responsibility Center Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where ("Global Dimension No." = const (1));
        }
    }

    keys
    {
        key(PK; "User ID ", "Shortcut Dimension 1 Code", "Responsibility Center")
        {
            Clustered = true;
        }
    }
    var
        UserMgmt: Codeunit "User Management";
        ResponsibilityCenter: Record "Responsibility Center";
}