page 50500 PropertyManagementRoleCenter
{
    ApplicationArea = All;
    Caption = 'MyRoleCenter';
    PageType = RoleCenter;

    layout
    {

    }


    actions
    {
        area(Sections)
        {
            group(PropertyManagement)
            {
                Caption = 'Property Management';
                action("Property Details")
                {
                    ApplicationArea = All;
                    Caption = 'Property Details';
                    RunObject = page "Property List";
                }

            }
        }

        area(Creation)
        {
            action(AddProperty)
            {
                Caption = 'Add New Property';
                Image = NewItem;
                RunObject = Page "Property List";
                RunPageMode = View;
            }
        }

        area(Processing)
        {
            action(BookProperty)
            {
                Caption = 'Register New Booking';
                Image = NewInvoice;
                RunObject = Page "Property List";
                RunPageMode = View;
            }

        }

    }
}

profile PropertyManager
{
    Caption = 'Property Manager';
    RoleCenter = PropertyManagementRoleCenter;
}


