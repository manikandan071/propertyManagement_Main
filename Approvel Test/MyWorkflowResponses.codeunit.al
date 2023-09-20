codeunit 50498 MyWorkflowResponses
{
    procedure MyWorkflowResponseCode(): code[128];
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', true, true)]
    local procedure AddMyWorkflowResponsesToLibrary()
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        WorkflowResponseHandling.AddResponseToLibrary(MyWorkflowResponseCode, Database::"Approval Table", 'Send a notification.', 'GROUP 0');
    end;
}