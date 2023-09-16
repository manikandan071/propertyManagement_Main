table 50407 BookingTable
{
    Caption = 'BookingTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; BookingNo; Code[20])
        {
            Caption = 'BookingNo';
        }
        field(2; PropertyNo; Code[20])
        {
            Caption = 'PropertyNo';
            TableRelation = "Property Table1";
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