table 50409 TenantExitTable
{
    Caption = 'TenantExitTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ExitNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No';
        }
        field(2; Status; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
            Editable = false;
        }
        field(3; PropertyNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'PropertyNo';
            TableRelation = "Property Table1" where(Status = filter("Agreement Signed"));
            trigger OnValidate()
            var
                properties: Record "Property Table1";
            begin
                properties.SetFilter("Property No", Rec.PropertyNo);
                if properties.FindSet() then begin
                    Rec."Tenant No" := properties."Tenant No";
                    Rec."Tenant Name" := properties."Tenant detail";
                    Rec."Property Description" := properties."Property Description";
                    Rec."Deposit Amount" := properties."Deposit Amount";
                end;
            end;
        }
        field(4; "Tenant Name"; Code[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Tenant Name';
            Editable = false;
            // FieldClass = FlowField;
            // CalcFormula = lookup("Property Table1"."Tenant detail" where("Property No" = field(PropertyNo)));
        }
        field(5; "Tenant No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Tenant No';
            Editable = false;
            // FieldClass = FlowField;
            // CalcFormula = lookup("Property Table1"."Tenant No" where("Property No" = field(PropertyNo)));
        }
        field(6; "Deposit Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Deposit Amount';
            Editable = false;
            // FieldClass = FlowField;
            // CalcFormula = lookup("Property Table1"."Deposit Amount" where("Property No" = field(PropertyNo)));
        }
        field(7; "Property Description"; code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Deposit Amount';
            Editable = false;
            // FieldClass = FlowField;
            // CalcFormula = lookup("Property Table1"."Property Description" where("Property No" = field(PropertyNo)));
        }
        field(14; "Gen. Jrnl Document no"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Gen. Jrnl Document no';
            Editable = false;
        }
    }
    keys
    {
        key(PK; ExitNo)
        {
            Clustered = true;
        }
    }

    var
        NoSeriesmgt: Codeunit NoSeriesManagement;
        ExitSeries: Record "No Series Setup";

    trigger OnInsert()
    var
        myInt: Integer;
    begin

        ExitSeries.Get();
        ExitSeries.TestField("Exit No Series");
        NoSeriesMgt.InitSeries(ExitSeries."Exit No Series", ExitSeries."Exit No Series", 0D, ExitNo, ExitSeries."Exit No Series");
        NoSeriesMgt.InitSeries(ExitSeries."Gen. Jrnl No Series", ExitSeries."Gen. Jrnl No Series", 0D, "Gen. Jrnl Document no", ExitSeries."Gen. Jrnl No Series");
    end;
}
