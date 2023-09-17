table 50312 "Maintenance Lines"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Maintenance Header";
        }

        field(2; "Inspection No"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Inspection Table";
        }
        field(3; "Inspection Description"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Charges Header";
        }
        field(5; "Vendor Name"; Code[100])
        {
            // FieldClass = FlowField;
            // CalcFormula = lookup("Vendor Charges Header"."Vendor Name" where("Vendor No." = field("Vendor No")));
            // Editable = false;
        }
        field(6; "Vendor Charge No"; Code[20])
        {
            // FieldClass = FlowField;
            // CalcFormula = lookup("Vendor Charges Header"."Charge No." where("Vendor No." = field("Vendor No")));
            // Editable = false;
        }
        field(7; "Service"; text[50])
        {
            // TableRelation = "Vendor Charges Lines"."Service Description" where("Document No." = field("Vendor Charge No"));
        }
        field(8; "Service charge"; Integer)
        {
            // FieldClass = FlowField;
            // CalcFormula = lookup("Vendor Charges Lines"."Service Charge" where("Service Description" = field(Service)));
            // Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No", "Inspection No")
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