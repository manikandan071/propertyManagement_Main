page 50309 BookingListPage
{
    ApplicationArea = All;
    Caption = 'BookingListPage';
    PageType = List;
    SourceTable = BookingTable;
    UsageCategory = Administration;
    CardPageId = BookingCardPage;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(BookingNo; Rec.BookingNo)
                {
                    ToolTip = 'Specifies the value of the BookingNo field.';
                }
                field(PropertyNo; Rec.PropertyNo)
                {
                    ToolTip = 'Specifies the value of the PropertyNo field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(PhoneNumber; Rec.PhoneNumber)
                {
                    ToolTip = 'Specifies the value of the PhoneNumber field.';
                }

            }
        }
    }
}
