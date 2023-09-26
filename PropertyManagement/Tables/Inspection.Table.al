table 50410 "Inspection Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Inspection  No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Property No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Property Table1";
        }
        field(3; "Property Description"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Property Table1"."Property Description" where("Property No" = field("Property No.")));
            Editable = false;
        }
        field(4; "Maintenance Description"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Inspection Status"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Assigned By"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Assigned By1"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Tenent","Company";
        }
    }

    keys
    {
        key(Key1; "Inspection  No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Inspection  No.", "Property No.", "Property Description", "Maintenance Description") { }
    }

    var
        NoSeriesmgt: Codeunit NoSeriesManagement;
        InspectionNoSeries: Record "No Series Setup";

    // LinesTable: Record "Maintenance Lines1";


    trigger OnInsert()
    begin
        InspectionNoSeries.Get();
        InspectionNoSeries.TestField("Inspection No Series");
        NoSeriesMgt.InitSeries(InspectionNoSeries."Inspection No Series", InspectionNoSeries."Inspection No Series", 0D, "Inspection  No.", InspectionNoSeries."Inspection No Series");

        // LinesTable.Init();
        // LinesTable."Inspection No" := Rec."Property No.";
        // LinesTable.Insert();

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