table 50408 RentTable
{
    Caption = 'RentTable';
    DataClassification = ToBeClassified;
    DrillDownPageId = RentListPage;
    LookupPageId = RentListPage;
    fields
    {
        field(1; RentNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'RentNo';
            Editable = false;
        }
        field(2; PropertyNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'PropertyNo';
            // TableRelation = "Property Table1" where(Status = filter("Agreement Signed"));
            TableRelation = "Property Table1" where(Status = filter("Agreement Signed"));
            trigger OnValidate()
            var
                properties: Record "Property Table1";
            begin
                properties.SetFilter("Property No", Rec.PropertyNo);
                if properties.FindSet() then begin
                    Rec.RentAmount := properties."Rent Amount";
                    Rec."Tenant No." := properties."Tenant No";
                    Rec."Tenant detail" := properties."Tenant detail";
                    Rec.PayRentAmount := properties."Rent Amount";
                end;
            end;
        }
        field(3; "Date Of Paid"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date Of Paid';
        }
        field(4; RentAmount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rent Amount';
            // FieldClass = FlowField;
            // CalcFormula = lookup("Property Table1"."Rent Amount" where("Property No" = field(PropertyNo)));
            Editable = false;
        }
        field(5; PayRentAmount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Pay Rent Amount';
            // FieldClass = FlowField;
            // CalcFormula = lookup("Property Table1"."Rent Amount" where("Property No" = field(PropertyNo)));
            // Editable = false;
        }
        field(6; "Tenant detail"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Tenant Details';
            // FieldClass = FlowField;
            // CalcFormula = lookup("Property Table1"."Tenant detail" where("Property No" = field(PropertyNo)));
            Editable = false;
        }
        field(7; "Tenant No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Tenant No.';
            // FieldClass = FlowField;
            // CalcFormula = lookup(Customer."No." where(Name = field("Tenant detail")));
            Editable = false;
        }
        field(8; "Gen. Jrnl Document no"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Gen. Jrnl Document no';
            Editable = false;
        }
        field(9; "Invoice No"; code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Invoice No';
            TableRelation = "Sales Invoice Header" where("Bill-to Customer No." = FIELD("Tenant No."), Closed = filter('No'));
            // TableRelation = if (type = const(RentTable))"Sales Invoice Header" where("Bill-to Customer No." = field("Tenant No.")) else if (type = const(Customer))"Sales Invoice Header" where(Closed = filter('No'));
        }
        field(10; Ispayment; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Payment';
            Editable = false;
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

    trigger OnModify()
    var
        property: Record "Property Table1";
    begin
    end;

}
