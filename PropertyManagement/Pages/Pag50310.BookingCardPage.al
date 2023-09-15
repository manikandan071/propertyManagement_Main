page 50310 BookingCardPage
{
    ApplicationArea = All;
    Caption = 'BookingCardPage';
    PageType = Card;
    SourceTable = BookingTable;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
