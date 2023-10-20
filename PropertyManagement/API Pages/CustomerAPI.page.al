page 50151 "Customer API"
{
    ApplicationArea = All;
    PageType = API;
    Caption = 'CustomerAPI';
    APIPublisher = 'TechnoRUCS';
    APIGroup = 'groupName';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'entityName';
    EntitySetName = 'entitySetName';
    SourceTable = Customer;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(CustomerType; Rec."Customer Type")
                {
                    Caption = 'fieldCaption';
                }
                field(Sales; Rec."Sales (LCY)")
                {
                    Caption = 'fieldCaption';
                }
                field(Name; Rec.Name)
                {
                    Caption = 'fieldCaption';
                }
            }
        }
    }
}