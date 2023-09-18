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

            }

            group(CustomerDetails)
            {
                Caption = 'Customer Details';

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
    actions
    {
        area(Processing)
        {
            action(Submit)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    PropertyList: Record "Property Table1";
                begin
                    if Rec.PropertyNo <> '' then begin
                        PropertyList.Init();
                        PropertyList.Reset();
                        PropertyList.SetFilter(PropertyList."Property No", Rec.PropertyNo);
                        if PropertyList.FindSet() then begin
                            PropertyList."Tenant detail" := Rec."Customer Name";
                            PropertyList.Status := PropertyList.Status::Booked;
                            PropertyList.Modify();
                            Message('Property No %1 Booked', PropertyList."Property No");
                        end;
                        if Rec.PropertyNo <> xRec.PropertyNo then begin
                            Message('if %1', xRec.PropertyNo);
                            PropertyList.Init();
                            PropertyList.Reset();
                            PropertyList.SetFilter(PropertyList."Property No", xRec.PropertyNo);
                            if PropertyList.FindSet() then begin
                                PropertyList."Tenant detail" := '';
                                PropertyList.Status := PropertyList.Status::Booked;
                                PropertyList.Modify();
                                Message('Modified Property No %1 Booked. %2', PropertyList."Property No", xRec.PropertyNo);
                            end;
                            if xRec.PropertyNo <> '' then begin
                                PropertyList.Init();
                                PropertyList.Reset();
                                PropertyList.SetFilter(PropertyList."Property No", xRec.PropertyNo);
                                if PropertyList.FindSet() then begin
                                    PropertyList."Tenant detail" := Rec."Customer Name";
                                    PropertyList.Status := PropertyList.Status::Available;
                                    PropertyList.Modify();
                                    Message('Property No %1 Booked', PropertyList."Property No");
                                end;
                            end;
                        end
                    end
                    else
                        Error('Please Select Property');
                end;
            }
        }
    }
}
