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
        field(2; PropertyNo; Code[20])
        {
            Caption = 'PropertyNo';
            TableRelation = "Property Table1";
        }
        field(3; TenantName; Code[100])
        {
            Caption = 'TenantName';
            FieldClass = FlowField;
            CalcFormula = lookup("Property Table1"."Tenant detail" where("Property No" = field(PropertyNo)));
        }
        field(4; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "Booked","Exited";
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

    end;
}
