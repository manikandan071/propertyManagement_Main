table 50416 "Property Picture"
{
    Caption = 'Property Picture Galley';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Property No."; Code[20])
        {
            Caption = 'Property No.';
            TableRelation = "Property Table1";
            DataClassification = CustomerContent;
        }
        field(2; "Property Picture No."; Integer)
        {
            Caption = 'Property Picture No.';
            DataClassification = CustomerContent;
        }
        field(3; Picture; MediaSet)
        {
            Caption = 'Picture';
            DataClassification = CustomerContent;
        }
        field(5; Sequencing; Integer)
        {
            Caption = 'Sequencing';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Property No.", "Property Picture No.")
        {
            Clustered = true;
        }
    }
}