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
        field(4; "VendorNumber"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Charge';
            TableRelation = Vendor;
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
    // ChargesDetails: Record "Vendor Charges Header";
    // NewNumber: Code[20];

    trigger OnInsert()
    begin

        // ChargesDetails.Init();
        // ChargesDetails.Reset();
        // ChargesDetails.SetFilter("Charge No.", Rec."Document No.");
        // if ChargesDetails.FindFirst() then begin
        //     Message(ChargesDetails."Vendor No.");
        //     NewNumber := ChargesDetails."Vendor No.";
        // end;

        // Message(NewNumber);
        // if NewNumber <> '' then begin
        //     Rec.Get();
        //     Rec.VendorNumber := NewNumber;
        //     Rec.Modify();
        // end;

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