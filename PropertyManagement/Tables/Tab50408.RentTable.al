table 50408 RentTable
{
    Caption = 'RentTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; RentNo; Code[20])
        {
            Caption = 'RentNo';
            Editable = false;
        }
        field(2; PropertyNo; Code[20])
        {
            Caption = 'PropertyNo';
            TableRelation = "Property Table1";
        }
        field(3; Amount; Integer)
        {
            Caption = 'Amount';
        }
        field(4; "Date Of Paid"; Date)
        {
            Caption = 'Date Of Paid';
        }
        field(5; RentAmount; Decimal)
        {
            Caption = 'Rent Amount';
            FieldClass = FlowField;
            CalcFormula = lookup("Property Table1"."Rent Amount" where("Property No" = field(PropertyNo)));
            Editable = false;
        }
        field(6; "Tenant detail"; Text[100])
        {
            Caption = 'Tenant Details';
            FieldClass = FlowField;
            CalcFormula = lookup("Property Table1"."Tenant detail" where("Property No" = field(PropertyNo)));
            Editable = false;
        }
        field(7; "Tenant No."; code[20])
        {
            Caption = 'Tenant No.';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."No." where(Name = field("Tenant detail")));
            Editable = false;
        }
        field(8; "Gen. Jrnl Document no"; code[20])
        {
            Caption = 'Gen. Jrnl Document no';
            Editable = false;
        }
        field(9; "Invoice No"; code[30])
        {
            Caption = 'Invoice No';
        }
        field(10; Ispayment; Boolean)
        {
            Caption = 'Payment';
            // Editable= false;
        }
    }
    keys
    {
        key(PK; RentNo)
        {
            Clustered = true;
        }
    }

    var
        NoSeriesmgt: Codeunit NoSeriesManagement;
        RentSeries: Record "No Series Setup";

    trigger OnInsert()
    var
        myInt: Integer;

    begin

        RentSeries.Get();
        RentSeries.TestField("Booking No Series");
        NoSeriesMgt.InitSeries(RentSeries."Rent No Series", RentSeries."Rent No Series", 0D, RentNo, RentSeries."Rent No Series");
        IF "Gen. Jrnl Document no" = '' then
            NoSeriesMgt.InitSeries(RentSeries."Gen. Jrnl No Series", RentSeries."Gen. Jrnl No Series", 0D, "Gen. Jrnl Document no", RentSeries."Gen. Jrnl No Series");
    end;

}
