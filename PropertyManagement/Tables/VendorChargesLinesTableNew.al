table 50415 "Vendor Charges Lines New"
{
    DataClassification = ToBeClassified;
    Caption = 'Charges Lines';
    fields
    {
        field(1; "Charge Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Document No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No.';
            TableRelation = "Vendor Charges Header";
        }
        field(3; "Service Description"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Description';
            TableRelation = Services;
        }
        field(4; "Service Charge"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Charge';
        }
        field(5; "VendorNumber"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Charge';
            TableRelation = Vendor;
        }
    }

    keys
    {
        key(Key1; "Charge Line No.")
        {
            Clustered = true;
        }
    }

    var
    //myInt: RecordId;
    // ChargesDetails: Record "Vendor Charges Header";
    // NewNumber: Code[20];

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