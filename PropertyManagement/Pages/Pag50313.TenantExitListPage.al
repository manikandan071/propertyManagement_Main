page 50313 TenantExitListPage
{
    ApplicationArea = All;
    Caption = 'Tenant Exit Details';
    PageType = List;
    SourceTable = TenantExitTable;
    UsageCategory = Administration;
    CardPageId = TenantExitCardPage;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ExitNo; Rec.ExitNo)
                {
                    ToolTip = 'Specifies the value of the ExitNo field.';
                }
                field(PropertyNo; Rec.PropertyNo)
                {
                    ToolTip = 'Specifies the value of the PropertyNo field.';
                }
                field(TenantNo; Rec."Tenant No")
                {

                }
                field(TenantName; Rec."Tenant Name")
                {

                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
