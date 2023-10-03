table 50414 "Rent Lines"
{
    DataClassification = ToBeClassified;
    Caption = 'Charges Lines';
    fields
    {
        field(1; "Rent No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No.';
            TableRelation = RentTable;
            Editable = false;
        }
        field(2; "Paid Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Paid Amount';
            Editable = false;
        }
        field(3; "Remining Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Remining Amount';
            Editable = false;

        }
        field(4; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Rent No.", "Line No")
        {
            Clustered = true;
        }
    }
}