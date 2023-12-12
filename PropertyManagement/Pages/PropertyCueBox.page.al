page 50330 "Property Cue Page"
{
    PageType = CardPart;
    SourceTable = "Property Cue Table";

    layout
    {

        area(content)
        {
            cuegroup(SalesCueContainer)
            {
                Caption = 'Properties Approvals';
                // CuegroupLayout = Wide;
                field("Property Booked"; Rec."Property Booked")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Pending Approvals';
                    DrillDownPageId = BookingListPage;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        p: Record BookingTable;
    begin
        p.Init();
        p.SetFilter(Status, 'Pending');
        // Message('%1', p.Count());
    end;
}