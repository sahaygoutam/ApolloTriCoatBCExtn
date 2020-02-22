pageextension 50100 ItemCardTriCoatEnt extends "Item Card"
{
    layout
    {

        addlast(Item)
        {
            field("Item Classification"; "Item Classification")
            {
                ApplicationArea = ALL;
            }
            field(Length; Length)
            {
                ApplicationArea = ALL;
            }
            field(Width; Width)
            {
                ApplicationArea = ALL;
            }
            field(Size; Size)
            {
                ApplicationArea = ALL;
            }
            field(Thickness; Thickness)
            {
                ApplicationArea = ALL;
            }
            field("End Condition"; "End Condition")
            {
                ApplicationArea = ALL;
            }
            field(OuterDia; OuterDia)
            {
                ApplicationArea = ALL;
            }
            field(InnerDia; InnerDia)
            {
                ApplicationArea = ALL;
            }
            field("Width Tolerance"; "Width Tolerance")
            {
                ApplicationArea = ALL;
            }
            field("Thickness Tolerance"; "Thickness Tolerance")
            {
                ApplicationArea = ALL;
            }
            field("Item Tolrence"; "Item Tolrence")
            {
                ApplicationArea = ALL;
            }
            field("QC Enable"; "QC Enable")
            {
                ApplicationArea = ALL;
            }
            field(Grade; Grade)
            {
                ApplicationArea = ALL;
            }
            field("Item Type"; "Item Type")
            {
                ApplicationArea = ALL;
            }
            field(Stamp; Stamp)
            {
                ApplicationArea = ALL;
            }
            field("Surface Condition"; "Surface Condition")
            {
                ApplicationArea = ALL;
            }
            field("IS Specifications"; "IS Specifications")
            {
                ApplicationArea = ALL;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}