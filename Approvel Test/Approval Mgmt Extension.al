codeunit 50496 "Approval Mgmt Extension"
{
    trigger OnRun()
    begin

    end;

    [IntegrationEvent(false, false)]
    procedure OnSendBookingForApproval(var Book: Record "Approval Table")
    begin

    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelBookingForApproval(var Book: Record "Approval Table")
    begin

    end;

    procedure checkclaimapprovalsworkflowenabled(var book: Record "Approval Table"): Boolean
    begin
        if not isclaimdocapprovalsworkflowenabled(book) then
            Error(noworkflowenablederr);
        exit(true);
    end;

    procedure isclaimdocapprovalsworkflowenabled(var Book: Record "Approval Table"): Boolean
    begin
        if Book."Approval Status" <> Book."Approval Status"::Open then
            exit(false);
        exit(workflowmanagement.CanExecuteWorkflow(Book, workfloweventhandlingcust.Runworkflowonsendclaimforapprovalcode));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnPopulateApprovalEntryArgument, '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        Book: Record "Approval Table";
    begin
        case RecRef.Number of
            database::"Approval Table":
                begin
                    RecRef.SetTable(Book);
                    ApprovalEntryArgument."Document No." := Book.ID;
                end;

        end;
    end;

    var
        workflowmanagement: Codeunit 1501;
        workfloweventhandlingcust: Codeunit 50494;

        noworkflowenablederr: TextConst ENU = 'No approval workflow for this record type is enabled';

}