table 50407 BookingTable
{
    Caption = 'BookingTable';
    DataClassification = ToBeClassified;
    DrillDownPageId = BookingListPage;
    LookupPageId = BookingListPage;

    fields
    {
        field(1; BookingNo; Code[20])
        {
            Caption = 'BookingNo';
            Editable = false;
        }
        field(2; PropertyNo; Code[20])
        {
            Caption = 'PropertyNo';
            TableRelation = "Property Table1" where(Status = filter(Available));
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(4; Email; Text[100])
        {
            Caption = 'Email';
        }
        field(5; PhoneNumber; Integer)
        {
            Caption = 'PhoneNumber';
        }
        field(6; BookingNoSeries; Code[20])
        {
            Caption = 'PhoneNumber';
        }
        field(7; Status; Enum "Custom Approval Enum")
        {
            Caption = 'Status';
            Editable = false;
        }
        field(8; PhoneNumber1; Text[30])
        {
            Caption = 'PhoneNumber';
        }
        field(9; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(10; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(11; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            FieldClass = FlowField;
            CalcFormula = lookup("Gen. Business Posting Group"."Def. VAT Bus. Posting Group" where(Code = field("Gen. Bus. Posting Group")));
            Editable = false;
        }
        field(12; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
    }
    keys
    {
        key(PK; BookingNo)
        {
            Clustered = true;
        }
    }

    var
        NoSeriesmgt: Codeunit NoSeriesManagement;
        BookingSeries: Record "No Series Setup";

    trigger OnInsert()
    var
        myInt: Integer;
    begin

        BookingSeries.Get();
        BookingSeries.TestField("Booking No Series");
        NoSeriesMgt.InitSeries(BookingSeries."Booking No Series", BookingSeries."Booking No Series", 0D, BookingNo, BookingSeries."Booking No Series");

    end;

}
