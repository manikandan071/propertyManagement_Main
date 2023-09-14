table 50406 "Vendor Charges Lines"
{
    DataClassification = ToBeClassified;
    Caption = 'Charges Lines';
    fields
    {
        field(1; "Document No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No.';
            TableRelation = "Vendor Charges Header";
        }
        field(2; "Service Description"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Description';
            TableRelation = Services;
        }
        field(3; "Service Charge"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Charge';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Service Description")
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