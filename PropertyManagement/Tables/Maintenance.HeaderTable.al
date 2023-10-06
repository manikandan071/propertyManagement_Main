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
            trigger OnValidate()
            var
                properties: Record "Property Table1";
                MaintenanceLines: Record "Maintenance Lines1";
                InspectionList: Record "Inspection Table";
                InspectionLines: Record "Inspection Lines";
            begin
                properties.SetFilter("Property No", Rec."Property No.");
                if properties.FindSet() then begin
                    Rec."Property Description" := properties."Property Description";
                    Rec."Property Owner" := properties."Property Owner";
                end;
                if Rec."Property No." <> '' then begin
                    MaintenanceLines.SetFilter("Document No", Rec."Manitenance No.");
                    if MaintenanceLines.FindSet() then begin
                        repeat
                            MaintenanceLines.Delete();
                        until MaintenanceLines.Next() = 0;
                    end;
                    InspectionList.SetFilter("Property No.", Rec."Property No.");
                    if InspectionList.FindSet() then begin
                        repeat
                            // Message('%1', InspectionList."Inspection No.");
                            InspectionLines.Init();
                            // InspectionLines.Reset();
                            InspectionLines.SetFilter("Document No.", InspectionList."Inspection No.");
                            if InspectionLines.FindSet() then begin
                                repeat
                                    if InspectionLines.Services <> '' then begin
                                        MaintenanceLines."Document No" := Rec."Manitenance No.";
                                        MaintenanceLines."Inspection No" := InspectionList."Inspection No.";
                                        MaintenanceLines."Inspection Description" := InspectionLines."Inspection Description";
                                        MaintenanceLines."Line No" := MaintenanceLines."Line No" + 1;
                                        MaintenanceLines.Service := InspectionLines.Services;
                                        MaintenanceLines."Vendor No" := '';
                                        MaintenanceLines."Vendor Name" := '';
                                        MaintenanceLines."Service charge" := 0;
                                        MaintenanceLines.Insert();
                                    end;
                                until InspectionLines.Next() = 0;
                            end;
                        until InspectionList.Next() = 0;
                    end;
                end;
            end;
        }
        field(3; "Property Description"; Code[30])
        {
            // FieldClass = FlowField;
            // CalcFormula = lookup("Property Table1"."Property Description" where("Property No" = field("Property No.")));
            Editable = false;
        }
        field(4; "Property Owner"; text[30])
        {
            // FieldClass = FlowField;
            // CalcFormula = lookup("Property Table1"."Property Owner" where("Property No" = field("Property No.")));
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

    // trigger OnModify()
    // var
    //     MaintenanceLines: Record "Maintenance Lines1";
    //     InspectionList: Record "Inspection Table";
    //     InspectionLines: Record "Inspection Lines";
    // begin
    //     if Rec."Property No." <> '' then begin
    //         InspectionList.SetFilter("Property No.", Rec."Property No.");
    //         if InspectionList.FindSet() then begin
    //             repeat
    //                 Message('%1', InspectionList."Inspection No.");
    //                 InspectionLines.Init();
    //                 // InspectionLines.Reset();
    //                 InspectionLines.SetFilter("Document No.", InspectionList."Inspection No.");
    //                 if InspectionLines.FindSet() then begin
    //                     repeat
    //                         Message('Msg %1', InspectionList."Inspection No.");
    //                         MaintenanceLines."Document No" := Rec."Manitenance No.";
    //                         MaintenanceLines."Inspection No" := InspectionList."Inspection No.";
    //                         MaintenanceLines."Inspection Description" := InspectionLines."Inspection Description";
    //                         MaintenanceLines."Line No" := MaintenanceLines."Line No" + 1;
    //                         MaintenanceLines.Service := InspectionLines.Services;
    //                         MaintenanceLines.Insert();
    //                     until InspectionList.Next() = 0;
    //                 end;
    //             until InspectionList.Next() = 0;
    //         end;
    //     end;
    // end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}