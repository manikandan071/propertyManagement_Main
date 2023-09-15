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
                    RunObject = page PageName;
                }

            }
        }

        area(Creation)
        {
            action(AddProperty)
            {
                Caption = 'Add New Property';
                Image = NewItem;
                RunObject = Page PageName;
                RunPageMode = View;
            }
        }

        area(Processing)
        {
            action(BookProperty)
            {
                Caption = 'Register New Booking';
                Image = NewInvoice;
                RunObject = Page "PageName";
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


