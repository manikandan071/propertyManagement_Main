table 50495 "Approval Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "ID"; Code[20])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if ID <> '' then
                    ID := format(ID);
            end;
        }

        field(2; "Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "","Pending","Approved";
        }
        field(3; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Approval Status"; enum "Approval Enum")
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; ID)
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