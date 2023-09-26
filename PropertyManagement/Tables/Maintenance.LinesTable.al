table 50313 "Maintenance Lines1"
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
            TableRelation = "Inspection Table";
        }
        field(3; "Inspection Description"; Code[100])
        {
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = lookup("Inspection Table"."Maintenance Description" where("Inspection  No." = field("Inspection No")));
            Editable = false;
        }
        field(4; "Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(5; "Vendor Name"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No")));
            Editable = false;
        }
        field(6; "Vendor Charge No"; Code[20])
        {
            ObsoleteState = Removed;
        }
        field(7; "Service"; text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Services;
        }
        field(8; "Service charge"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Vendor Charges Lines New"."Service Charge" where(VendorNumber = field("Vendor No"), "Service Description" = field(Service)));
        }
        field(9; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Inspection Table";
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Document No", "Line No")
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