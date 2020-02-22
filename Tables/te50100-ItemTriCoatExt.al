tableextension 50100 ItemTriCoatExt extends Item
{
    fields
    {
        field(50100; "Item Classification"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item Classification';
            TableRelation = "Item Classification"."Item Classification Type" where ("Item Category Code" = field ("Item Category Code"));
        }
        field(50101; Length; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; Width; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50103; Size; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "End Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Plain End","Bevel End",SWS,SS;
            OptionCaption = ' ,Plain End,Bevel End,SWS,SS';
        }
        field(50106; OuterDia; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50107; InnerDia; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Width Tolerance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50109; "Thickness Tolerance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "QC Enable"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Item Tolrence"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Test Filters"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50113; Grade; Option)
        {
            OptionMembers = " ","YST-210","YST-240","YST-310","YST-355","T-12","C-06","C-10","G-05","G15";
            OptionCaption = ' ,YST-210,YST-240,YST-310,YST-355,T-12,C-06,C-10,G-05,G15';
            DataClassification = ToBeClassified;
        }
        field(50114; "Item Type"; Option)
        {
            OptionMembers = " ",Coil,"Wide Slit","Narrow Slit";
            OptionCaption = ' ,Coil,Wide Slit,Narrow Slit';
            DataClassification = ToBeClassified;
        }
        field(50115; Stamp; Option)
        {
            OptionMembers = " ","APL Apollo",Green,"Without Stamp";
            OptionCaption = ' ,APL Apollo,Green,Without Stamp';
            DataClassification = ToBeClassified;
        }
        field(50116; "Surface Condition"; Option)
        {
            OptionMembers = " ",Varnished,"Self Colour",Voild;
            OptionCaption = ' ,Varnished,Self Colour,Voild';
            DataClassification = ToBeClassified;
        }
        field(50117; "IS Specifications"; Option)
        {
            OptionMembers = Special,"IS-1239","IS-3601","IS-4923","IS-1161","IS-3589","IS-9295","IS-4270","ASTMA-500","BS-1387","EN-1021";
            OptionCaption = 'Special,IS-1239,IS-3601,IS-4923,IS-1161,IS-3589,IS-9295,IS-4270,ASTMA-500, BS-1387,EN-1021';
            DataClassification = ToBeClassified;
        }
    }

}