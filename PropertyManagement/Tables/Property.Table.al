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
        }
        field(3; "Property Description"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Property Owner"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Tenant detail"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
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
            OptionMembers = "","Available","Booked";
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
        fieldgroup(DropDown; "Property No", "Property Description", "Property Owner", "Deposit Amount", "Rent Amount")
        {

        }
        fieldgroup(Brick; "Property No", "Property Description", "Property Owner", "Deposit Amount", "Rent Amount")
        {

        }
    }

    var
        myInt: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        "Property No Series": Record "No Series Setup";

    trigger OnInsert()
    begin
        "Property No Series".Init();
        if "Property No Series".FindSet() then
            repeat
                Message('Property No %1', "Property No Series"."Property No Series");
                IF "Property No" = '' then
                    NoSeriesMgt.InitSeries("Property No Series"."Property No Series", "Property No Series"."Property No Series", 0D, "Property No", "Property No Series"."Property No Series");
            until "Property No Series".Next() = 0;
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