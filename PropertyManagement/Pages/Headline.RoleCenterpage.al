page 50320 "Headline RC Property Manager"
{
    PageType = HeadlinePart;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group("AppName Headline")
            {
                Visible = AppNameHeadlineVisible;
                ShowCaption = false;
                Editable = false;

                field(FirstInsight; FirstInsightText)
                {
                    ApplicationArea = Basic, Suite;
                    // NavigationPageId = BookingListPage;
                    trigger OnDrillDown();
                    var
                    begin
                        OnDrillDownFirstInsight();
                        Message('mani');
                    end;

                }
                field(SecondInsight; SecondInsightText)
                {
                    ApplicationArea = Basic, Suite;
                    trigger OnDrillDown();
                    var
                    begin
                        OnDrillDownSecondInsight();
                    end;
                }

            }
        }
    }

    var
        [InDataSet]
        AppNameHeadlineVisible: Boolean;
        FirstInsightText: Text;
        SecondInsightText: Text;

    trigger OnOpenPage()
    var
        BookingList: Record BookingTable;
    begin
        RCHeadlinesPageCommon.HeadlineOnOpenPage(Page::PropertyManagementRoleCenter);
        HandleVisibility();

        BookingList.Init();
        BookingList.Reset();
        if BookingList.FindSet() then
            repeat
                if BookingList.Status = BookingList.Status::Pending then begin
                    FirstInsightText := 'Approval Pending No' + BookingList.BookingNo;
                end;
            until BookingList.Next = 0;
        SecondInsightText := 'kalimuthu';

        // HandleFirstInsight();
        // HandleSecondInsight();

        OnSetVisibility(AppNameHeadlineVisible);
    end;

    local procedure HandleVisibility()
    var
    begin
        AppNameHeadlineVisible := true;
    end;

    // local procedure HandleFirstInsight()
    // var
    //     HeadlineManagement: Codeunit "Headline Management";
    //     PayloadText: Text;
    //     QualifierText: Text;
    // begin
    //     PayloadText := HeadlineManagement.Emphasize('Some text to highlight') + ' Some other text';
    //     QualifierText := 'Some name of the insight';
    //     HeadlineManagement.GetHeadlineText(QualifierText, PayloadText, FirstInsightText);

    // end;

    // local procedure HandleSecondInsight();
    // var
    //     HeadlineManagement: Codeunit "Headline Management";
    //     PayloadText: Text;
    //     QualifierText: Text;
    // begin
    //     PayloadText := HeadlineManagement.Emphasize('Some text to highlight') + ' Some other text';
    //     QualifierText := 'Some name of the insight';
    //     HeadlineManagement.GetHeadlineText(QualifierText, PayloadText, SecondInsightText);

    // end;

    local procedure OnDrillDownFirstInsight();
    var

    begin

    end;

    local procedure OnDrillDownSecondInsight();
    var
    begin

    end;

    [IntegrationEvent(false, false)]
    local procedure OnSetVisibility(var AppNameHeadlineVisible: Boolean)
    begin
    end;

    var
        RCHeadlinesPageCommon: Codeunit "RC Headlines Page Common";
}