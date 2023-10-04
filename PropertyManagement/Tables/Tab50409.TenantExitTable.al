table 50409 TenantExitTable
{
    Caption = 'TenantExitTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ExitNo; Code[20])
        {
            Caption = 'ExitNo';
        }
        field(2; Status; Boolean)
        {
            Caption = 'Status';
            Editable = false;
        }
        field(3; PropertyNo; Code[20])
        {
            Caption = 'PropertyNo';
            TableRelation = "Property Table1" where(Status = filter("Agreement Signed"));
        }
        field(4; "Tenant Name"; Code[100])
        {
            Caption = 'Tenant Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Property Table1"."Tenant detail" where("Property No" = field(PropertyNo)));
        }
        field(5; "Tenant No"; Code[20])
        {
            Caption = 'Tenant No';
            FieldClass = FlowField;
            CalcFormula = lookup("Property Table1"."Tenant No" where("Property No" = field(PropertyNo)));
        }
        field(6; "Deposit Amount"; Decimal)
        {
            Caption = 'Deposit Amount';
            FieldClass = FlowField;
            CalcFormula = lookup("Property Table1"."Deposit Amount" where("Property No" = field(PropertyNo)));
        }
        field(7; "Property Description"; code[30])
        {
            Caption = 'Deposit Amount';
            FieldClass = FlowField;
            CalcFormula = lookup("Property Table1"."Property Description" where("Property No" = field(PropertyNo)));
        }
        field(14; "Gen. Jrnl Document no"; code[20])
        {
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
