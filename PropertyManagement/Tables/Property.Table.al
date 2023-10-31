table 50403 "Property Table1"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary key"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Property No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Property Description"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Property Owner"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Deposit Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Rent Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Available","Booked","Agreement Signed";
            Editable = false;
        }
        field(5; "Tenant detail"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Tenant No"; code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Property No")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Property No", "Property Description", "Property Owner", "Deposit Amount", "Rent Amount", "Tenant detail")
        {

        }
        fieldgroup(Brick; "Property No", "Property Description", "Property Owner", "Deposit Amount", "Rent Amount")
        {

        }
    }

    var
        myInt: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        "Properties No Series": Record "No Series Setup";

    trigger OnInsert()
    begin
        "Properties No Series".Init();
        if "Properties No Series".FindSet() then
            repeat
                IF "Property No" = '' then
                    NoSeriesMgt.InitSeries("Properties No Series"."Property No Series", "Properties No Series"."Property No Series", 0D, "Property No", "Properties No Series"."Property No Series");
            until "Properties No Series".Next() = 0;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}