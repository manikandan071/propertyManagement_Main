tableextension 50303 "Vendor Table Extension" extends Vendor
{
    fields
    {
        field(50300; "Vendor Type"; Option)
        {
            Caption = 'Vendor Type';
            DataClassification = ToBeClassified;
            OptionMembers = "","Normal","Service";
        }
    }
}
