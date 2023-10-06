page 50500 PropertyManagementRoleCenter
{
    ApplicationArea = All;
    Caption = 'MyRoleCenter';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Control139; "Headline RC Property Manager")
            {
                ApplicationArea = Basic, Suite;
            }
        }

    }


    actions
    {
        area(Sections)
        {
            // group(PropertyManagement)
            // {
            //     Caption = 'Property Management';
            //     action("Property Details")
            //     {
            //         ApplicationArea = All;
            //         Caption = 'Property Details';
            //         RunObject = page "Property List";
            //     }

            // }
        }

        area(Creation)
        {
            action(PropertySetup)
            {
                Caption = 'Property Management Setup';
                Image = NewItem;
                RunObject = Page "No series Setup";
                RunPageMode = View;
            }
            action(AddProperty)
            {
                Caption = 'Add New Property';
                Image = NewItem;
                RunObject = Page "Property List";
                RunPageMode = View;
            }

            action(PropertyBooking)
            {
                Caption = 'Property Booking';
                Image = NewItem;
                RunObject = Page BookingListPage;
                RunPageMode = View;
            }

            action(CustomerPage)
            {
                Caption = 'Customer Details';
                Image = NewItem;
                RunObject = codeunit "Tenant Customers";
                RunPageMode = View;
            }

            action(AgreementDetails)
            {
                Caption = 'Agreement Details';
                Image = NewItem;
                RunObject = Page "Agreement List Page";
                RunPageMode = View;
            }

            action(VendorDetails)
            {
                Caption = 'Vendor Details';
                Image = NewItem;
                RunObject = Page "Vendor List";
                RunPageMode = View;
            }

            action(ServiceDetails)
            {
                Caption = 'Service Details';
                Image = NewItem;
                RunObject = Page "Services List";
                RunPageMode = View;
            }

            action(VendorChargesDetails)
            {
                Caption = 'Vendor Charges Details';
                Image = NewItem;
                RunObject = Page "Vendor Charges List";
                RunPageMode = View;
            }

            action(InspectionDetails)
            {
                Caption = 'Inspection Details';
                Image = NewItem;
                RunObject = Page "Inspection List";
                RunPageMode = View;
            }

            action(MaintenanceDetails)
            {
                Caption = 'Maintenance Details';
                Image = NewItem;
                RunObject = Page "Maintenance List";
                RunPageMode = View;
            }

            action(RentDetails)
            {
                Caption = 'Rent Details';
                Image = NewItem;
                RunObject = Page RentListPage;
                RunPageMode = View;
            }

            action(TenantExitDetails)
            {
                Caption = 'Tenant Exit Details';
                Image = NewItem;
                RunObject = Page TenantExitListPage;
                RunPageMode = View;
            }
        }

        // area(Processing)
        // {
        //     action(BookProperty)
        //     {
        //         Caption = 'Register New Booking';
        //         Image = NewInvoice;
        //         RunObject = Page "Property List";
        //         RunPageMode = View;
        //     }

        // }

    }
}

profile PropertyManager
{
    Caption = 'Property Manager';
    RoleCenter = PropertyManagementRoleCenter;
    Enabled = true;
}


