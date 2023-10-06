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
            DataClassification = ToBeClassified;
            // FieldClass = FlowField;
            // CalcFormula = lookup("Inspection Table"."Maintenance Description" where("Inspection No." = field("Inspection No")));
            Editable = false;
        }
        field(4; "Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Vendor Charges Lines New" where("Service Description" = field(Service));
            TableRelation = "Vendor Charges Lines New".VendorNumber where("Service Description" = field(Service));
            trigger OnValidate()
            var
                Vendor: Record Vendor;
                VendorCharges: Record "Vendor Charges Lines New";
            begin
                Vendor.Get(Rec."Vendor No");
                Rec."Vendor Name" := Vendor.Name;
                VendorCharges.Init();
                VendorCharges.SetFilter(VendorNumber, Rec."Vendor No");
                VendorCharges.SetFilter("Service Description", Rec.Service);
                if VendorCharges.FindSet() then begin
                    Rec."Service charge" := VendorCharges."Service Charge";
                end;
            end;
            // trigger OnLookup()
            // var
            //     InspectionList: Record "Vendor Charges Lines New";
            // begin
            //     InspectionList.Reset();
            //     if Page.RunModal(Page::"Vendor Charges Subform", InspectionList) = Action::LookupOK then Rec."Vendor No" := InspectionList.VendorNumber;
            // end;
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
            // FieldClass = FlowField;
            DataClassification = ToBeClassified;
            // CalcFormula = lookup("Vendor Charges Lines New"."Service Charge" where(VendorNumber = field("Vendor No"), "Service Description" = field(Service)));
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