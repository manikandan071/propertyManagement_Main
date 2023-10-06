table 50420 "Inspection Lines"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Lines No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            AutoIncrement = true;
        }
        field(3; "Services"; text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Services;
            trigger OnValidate()
            var
                InspectionList: Record "Inspection Lines";
            begin
                InspectionList.SetFilter("Document No.", Rec."Document No.");
                if InspectionList.FindSet() then begin
                    repeat
                        if InspectionList.Services = Rec.Services then begin
                            Message('Already have specific Service');
                            Rec.Services := '';
                        end;
                    until InspectionList.Next() = 0;
                end;
            end;
        }
        field(4; "Inspection Description"; text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Lines No.")
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