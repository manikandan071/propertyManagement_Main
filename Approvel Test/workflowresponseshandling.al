codeunit 50493 "workflowresponsehandlingext"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure onopendocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Book: Record "Approval Table";

    begin
        case RecRef.Number of
            database::"Approval Table":
                begin
                    RecRef.SetTable(Book);
                    Book."Approval Status" := Book."Approval Status"::Open;
                    Book.Modify();
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Book: Record "Approval Table";

    begin
        case RecRef.Number of
            database::"Approval Table":
                begin
                    RecRef.SetTable(Book);
                    Book."Approval Status" := Book."Approval Status"::Approved;
                    Book.Modify();
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        Book: Record "Approval Table";
    begin
        case RecRef.Number of
            database::"Approval Table":
                begin
                    RecRef.SetTable(Book);
                    Book."Approval Status" := Book."Approval Status"::Pending;
                    Book.Modify();
                    IsHandled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        workflowresponsehandling: Codeunit 1521;
        workfloweventhandlingcust: Codeunit 50494;
    begin
        case ResponseFunctionName of

            workflowresponsehandling.SetStatusToPendingApprovalCode:
                workflowresponsehandling.AddResponsePredecessor(workflowresponsehandling.SetStatusToPendingApprovalCode, workfloweventhandlingcust.Runworkflowonsendclaimforapprovalcode);

            workflowresponsehandling.SendApprovalRequestForApprovalCode:
                workflowresponsehandling.AddResponsePredecessor(workflowresponsehandling.SendApprovalRequestForApprovalCode, workfloweventhandlingcust.Runworkflowonsendclaimforapprovalcode);

            workflowresponsehandling.CancelAllApprovalRequestsCode:
                workflowresponsehandling.AddResponsePredecessor(workflowresponsehandling.CancelAllApprovalRequestsCode, workfloweventhandlingcust.RunWorkFlowOncancelClaimForApprovalcode);

            workflowresponsehandling.OpenDocumentCode:
                workflowresponsehandling.AddResponsePredecessor(workflowresponsehandling.OpenDocumentCode, workfloweventhandlingcust.RunWorkFlowOncancelClaimForApprovalcode);

        end;

    end;

    var
        myInt: Integer;
}