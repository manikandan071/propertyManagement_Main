table 50408 RentTable
{
    Caption = 'RentTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; RentNo; Code[20])
        {
            Caption = 'RentNo';
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

    end;

}
