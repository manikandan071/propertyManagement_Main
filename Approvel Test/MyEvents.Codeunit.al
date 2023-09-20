codeunit 50497 MyEvents
{
    [IntegrationEvent(false, false)]
    procedure OnAfterPostPurchaseHeader(ApprovalHeader: Record "Approval Table")
    begin
    end;
}