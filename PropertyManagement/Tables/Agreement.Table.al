table 50402 "Agreement Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Agreement No."; code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Property No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Property Table1";
        }
        field(4; "Property Description"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Property Table1"."Property Description" where("Property No" = field("Property No.")));
            Editable = false;
        }
        field(5; "Property Owner"; text[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Property Table1"."Property Owner" where("Property No" = field("Property No.")));
            Editable = false;
        }
        field(6; "Property Deposit Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Property Table1"."Deposit Amount" where("Property No" = field("Property No.")));
            Editable = false;
        }
        field(7; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Customer Type" = const("Tenant"));
        }
        field(8; "Customer Name"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = false;
        }
        field(9; "Customer Address"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Address where("No." = field("Customer No.")));
            Editable = false;
        }
        field(10; "Customer Phone"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."Phone No." where("No." = field("Customer No.")));
            Editable = false;
        }
        field(11; "Customer City"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.City where("No." = field("Customer No.")));
            Editable = false;
        }
        field(12; "Customer Mail"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."E-Mail" where("No." = field("Customer No.")));
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Agreement No.")
        {
            Clustered = true;
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
                IF "Agreement No." = '' then
                    NoSeriesMgt.InitSeries("Property No Series"."Agreement No Series", "Property No Series"."Agreement No Series", 0D, "Agreement No.", "Property No Series"."Agreement No Series");
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