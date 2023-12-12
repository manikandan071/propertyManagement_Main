table 50404 "Vendor Charges Header"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Vendor Charges List";
    LookupPageId = "Vendor Charges List";

    fields
    {
        field(1; "Charge No."; code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor where("Vendor Type" = const("Service"));
        }
        field(3; "Vendor Name"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));
            Editable = false;
        }
        field(4; "Vendor Address"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Address where("No." = field("Vendor No.")));
            Editable = false;
        }
        field(5; "Vendor Phone"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."Phone No." where("No." = field("Vendor No.")));
            Editable = false;
        }
        field(6; "Vendor Eamil"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."E-Mail" where("No." = field("Vendor No.")));
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Charge No.")
        {
            Clustered = true;
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
                IF "Charge No." = '' then
                    // Message('Property No %1', "Properties No Series"."Charges No Series");
                NoSeriesMgt.InitSeries("Properties No Series"."Charges No Series", "Properties No Series"."Charges No Series", 0D, "Charge No.", "Properties No Series"."Charges No Series");
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