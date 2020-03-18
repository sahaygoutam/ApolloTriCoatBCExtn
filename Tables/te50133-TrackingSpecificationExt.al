tableextension 50133 TrackingSpecificationExt extends "Tracking Specification"
{
    fields
    {
        field(50100; "Number of Coils"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Vendor Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Rejected Location"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Excess Qty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup ("Sales Line"."Excess Qty" WHERE ("Document Type" = FILTER (Order), "Document No." = FIELD ("Source ID"), "Line No." = FIELD ("Source Ref. No.")));
        }
    }
}