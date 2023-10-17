page 50150 PropertyAPIPage
{
    APIGroup = 'PropertyManagement';
    APIPublisher = 'TechnoRUCS';
    APIVersion = 'v2.0', 'v1.0';
    ApplicationArea = All;
    Caption = 'propertyAPIPage';
    DelayedInsert = true;
    EntityName = 'PropertyAPITable';
    EntitySetName = 'PropertyAPITable';
    PageType = API;
    SourceTable = "Property Table1";
    ODataKeyFields = "Property No";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(depositAmount; Rec."Deposit Amount")
                {
                    Caption = 'Deposit Amount';
                }
                field(propertyDescription; Rec."Property Description")
                {
                    Caption = 'Property Description';
                }
                field(propertyNo; Rec."Property No")
                {
                    Caption = 'Property No';
                }
                field(propertyOwner; Rec."Property Owner")
                {
                    Caption = 'Property Owner';
                }
                field(rentAmount; Rec."Rent Amount")
                {
                    Caption = 'Rent Amount';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
            }
        }
    }
}
