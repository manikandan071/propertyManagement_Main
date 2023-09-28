codeunit 50494 workfloweventhandling
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", OnAddWorkflowEventsToLibrary, '', true, true)]
    local procedure onaddworkfloweventstolibrary()
    begin
        WorkFlowEventHandling.AddEventToLibrary(Runworkflowonsendclaimforapprovalcode, Database::"Approval Table", ClaimSendForapprovaleventdesctxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkFlowOncancelClaimForApprovalcode, Database::"Approval Table", ClaimSendForapprovalcanceleventdesctxt, 0, false);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", OnAddWorkflowEventPredecessorsToLibrary, '', true, true)]
    local procedure onaddworkfloweventpredescessorsTolibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkFlowOncancelClaimForApprovalcode:
                WorkFlowEventHandling.AddEventPredecessor(RunWorkFlowOncancelClaimForApprovalcode, Runworkflowonsendclaimforapprovalcode);
            WorkFlowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                WorkFlowEventHandling.AddEventPredecessor(WorkFlowEventHandling.RunWorkflowOnApproveApprovalRequestCode, Runworkflowonsendclaimforapprovalcode);
        end;
    end;

    procedure Runworkflowonsendclaimforapprovalcode(): code[128]
    var
        myInt: Integer;
    begin
        exit(UpperCase('Runworkflowonsendclaimforapproval'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt Extension", 'OnSendBookingForApproval', '', true, true)]
    local procedure RunWorkFlowOnSendClaimForApproval(var Book: Record "Approval Table")
    begin
        WorkFlowManagement.HandleEvent(Runworkflowonsendclaimforapprovalcode, Book);

    end;

    procedure RunWorkFlowOncancelClaimForApprovalcode(): Code[128]
    begin
        exit(UpperCase('RunWorkFlowOncancelClaimForApproval'));
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt Extension", 'OnCancelBookingForApproval', '', true, true)]
    local procedure RunWorkFlowOncancelClaimForApproval(var Book: Record "Approval Table")
    begin
        WorkFlowManagement.HandleEvent(RunWorkFlowOncancelClaimForApprovalcode, Book);
    end;

    var
        WorkFlowManagement: Codeunit 1501;
        WorkFlowEventHandling: Codeunit 1520;

        ClaimSendForapprovaleventdesctxt: TextConst ENU = 'Approval of a cliam document is requested';
        ClaimSendForapprovalcanceleventdesctxt: TextConst ENU = 'Approval of a cliam document is canceled';

}