table 50412 "Maintenance Header"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Maintenance List";
    LookupPageId = "Maintenance List";
    fields
    {
        field(1; "Manitenance No."; code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Property No."; code[20])
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
        field(4; "Property Owner"; text[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Property Table1"."Property Owner" where("Property No" = field("Property No.")));
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Manitenance No.")
        {
            Clustered = true;
        }
    }

    var
        NoSeriesmgt: Codeunit NoSeriesManagement;
        MaintenanceNoSeries: Record "No Series Setup";

    trigger OnInsert()
    begin
        MaintenanceNoSeries.Get();
        MaintenanceNoSeries.TestField("Maintenance No Series");
        NoSeriesMgt.InitSeries(MaintenanceNoSeries."Maintenance No Series", MaintenanceNoSeries."Maintenance No Series", 0D, "Manitenance No.", MaintenanceNoSeries."Maintenance No Series");
    end;

    trigger OnModify()
    var
        MaintenanceLines: Record "Maintenance Lines1";
        InspectionList: Record "Inspection Table";
    begin
        Message(Rec."Property No.");
        if Rec."Property No." <> '' then begin
            InspectionList.Init();
            InspectionList.Reset();
            InspectionList.SetFilter(InspectionList."Property No.", Rec."Property No.");
            if InspectionList.FindSet() then begin
                repeat
                    Message('Msg %1', InspectionList."Inspection  No.");
                    MaintenanceLines."Document No" := Rec."Manitenance No.";
                    MaintenanceLines."Inspection No" := InspectionList."Inspection  No.";
                    MaintenanceLines."Inspection Description" := InspectionList."Maintenance Description";
                    MaintenanceLines.Insert();
                until InspectionList.Next() = 0;
            end;
        end;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}