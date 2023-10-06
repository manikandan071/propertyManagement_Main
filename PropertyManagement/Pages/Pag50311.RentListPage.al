page 50311 RentListPage
{
    ApplicationArea = All;
    Caption = 'Rent Details';
    PageType = List;
    SourceTable = RentTable;
    UsageCategory = Administration;
    CardPageId = RentCardPage;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(RentNo; Rec.RentNo)
                {
                    ToolTip = 'Specifies the value of the RentNo field.';
                }
                field(PropertyNo; Rec.PropertyNo)
                {
                    ToolTip = 'Specifies the value of the PropertyNo field.';
                }
                field("Tenant detail"; Rec."Tenant detail")
                {
                    ToolTip = 'Specifies the value of the PropertyNo field.';
                }
                field(RentAmount; Rec.RentAmount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Date Of Paid"; Rec."Date Of Paid")
                {
                    ToolTip = 'Specifies the value of the Date Of Paid field.';
                }
                field(Ispayment; Rec.Ispayment)
                {
                    ToolTip = 'Specifies the value of the Date Of Paid field.';
                }
            }
        }
    }
}
