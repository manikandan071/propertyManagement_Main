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
            trigger OnValidate()
            var
                VendorCharges: Record "Vendor Charges Lines New";
            begin
                VendorCharges.SetFilter("Document No.", Rec."Document No.");
                if VendorCharges.FindSet() then begin
                    repeat
                        if VendorCharges."Service Description" = Rec."Service Description" then begin
                            Rec."Service Description" := '';
                            Message('Already have specific Service');
                        end;
                    until VendorCharges.Next() = 0;
                end;
            end;
        }
        field(4; "Service Charge"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Charge';
            NotBlank = true;
        }
        field(5; "VendorNumber"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor Details';
            Editable = false;
            // TableRelation = Vendor;
        }
    }

    keys
    {
        key(Key1; "Charge Line No.", "Document No.", VendorNumber)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; VendorNumber, "Service Description", "Service Charge") { }
    }

    var
        //myInt: RecordId;
        ChargesDetails: Record "Vendor Charges Header";
        NewNumber: Code[20];

    local procedure InsertVendorDetails()
    begin
        ChargesDetails.Init();
        ChargesDetails.Reset();
        if Rec."Document No." <> '' then begin
            ChargesDetails.SetFilter("Charge No.", Rec."Document No.");
            if ChargesDetails.FindFirst() then begin
                // Message(ChargesDetails."Vendor No.");
                // Message(ChargesDetails."Charge No.");
                if ChargesDetails."Vendor No." <> '' then begin
                    Rec."Document No." := ChargesDetails."Charge No.";
                    Rec.VendorNumber := ChargesDetails."Vendor No.";
                    Rec.Modify();
                end;
            end;
        end;
    end;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin
        // InsertVendorDetails();
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;


}