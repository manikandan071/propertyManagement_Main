table 50400 "No Series Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'No Series Setup';
    fields
    {
        field(1; "Primary Key"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Property No Series"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(3; "Booking No Series"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4; "Maintenance No Series"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5; "Agreement No Series"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}