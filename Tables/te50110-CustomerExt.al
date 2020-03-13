tableextension 50110 CustomerExt extends Customer
{
    fields
    {
        field(50000; "Credit Days"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; Distributor; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "Distributor Code" <> '' THEN
                    ERROR('Distributor code for Dealer Customer should be blank');
            end;
        }
        field(50002; "Distributor Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer WHERE (Distributor = CONST (true));
            trigger OnValidate()
            var
                T18: Record Customer;
            begin
                IF "Credit Limit (LCY)" <> 0 THEN
                    ERROR('Credit Limit of %1 should be Zero', Name);
                TESTFIELD(Distributor, FALSE);
                IF T18.GET("Distributor Code") THEN
                    "Distributor Name" := T18.Name;
            end;
        }
        field(50003; "Grace Period Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Available PDC Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum ("PDC Details".Amount WHERE ("Customer No." = FIELD ("No."), Status = FILTER (false)));
        }
        field(50005; "Remaining Credit Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50006; "Distributor Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Tolerance %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Send SMS"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}