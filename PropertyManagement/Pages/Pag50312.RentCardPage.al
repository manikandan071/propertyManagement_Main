page 50312 RentCardPage
{
    ApplicationArea = All;
    Caption = 'Rent Details';
    PageType = Card;
    SourceTable = RentTable;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(RentNo; Rec.RentNo)
                {
                    ToolTip = 'Specifies the value of the RentNo field.';
                }
                field(PropertyNo; Rec.PropertyNo)
                {
                    ToolTip = 'Specifies the value of the PropertyNo field.';
                }
                field("Date Of Paid"; Rec."Date Of Paid")
                {
                    ToolTip = 'Specifies the value of the Date Of Paid field.';
                }

                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
}
