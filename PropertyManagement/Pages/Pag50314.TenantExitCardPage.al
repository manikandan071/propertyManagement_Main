page 50314 TenantExitCardPage
{
    ApplicationArea = All;
    Caption = 'Tenant Exit Details';
    PageType = Card;
    SourceTable = TenantExitTable;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(ExitNo; Rec.ExitNo)
                {
                    ToolTip = 'Specifies the value of the ExitNo field.';
                }
                field(PropertyNo; Rec.PropertyNo)
                {
                    ToolTip = 'Specifies the value of the PropertyNo field.';
                }
                // field(TenantName; Rec.TenantName)
                // {

                // }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }

                field(TenantNameNew; Rec.TenantDetails)
                {

                }
            }
        }
    }
}
