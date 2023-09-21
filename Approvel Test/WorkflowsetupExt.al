codeunit 50460 Workflowsetupext
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', true, true)]
    local procedure OnAddWorkflowCategoriesToLibrary()
    begin
        WorkflowSetup.InsertWorkflowCategory(ClaimWorkflowCategoryTxt, ClaimWorkflowCategoryDescTxt);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAfterInsertApprovalsTableRelations', '', true, true)]
    local procedure OnAfterInsertApprovalsTableRelations()
    var
        approvalentry: Record 454;
    begin
        WorkflowSetup.InsertTableRelation(Database::"Approval Table", 0, Database::"Approval Entry", approvalentry.FieldNo("Record ID to Approve"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
    local procedure OnInsertWorkflowTemplates()
    begin
        insertclaimapprovalworkflowtemplate();
    end;

    local procedure insertclaimapprovalworkflowtemplate()
    var
        workflow: Record 1501;
    begin
        WorkflowSetup.InsertWorkflowTemplate(workflow, ClaimApprovalWorkflowCodeTxt, ClaimApprovalWorkflowCodeTxt, ClaimWorkflowCategoryTxt);
        insertclaimapprovalworkflowdetails(workflow);
        WorkflowSetup.MarkWorkflowAsTemplate(workflow);
    end;


    local procedure insertclaimapprovalworkflowdetails(var workflow: Record 1501)
    var
        workflowsteparugument: Record 1523;
        blankdateformula: DateFormula;
        workfloweventhandlingcust: Codeunit 50494;
        workflowresponsehandling: Codeunit 1521;
        Book: Record "Approval Table";
    begin
        WorkflowSetup.InitWorkflowStepArgument(workflowsteparugument, workflowsteparugument."Approver Type"::Approver, workflowsteparugument."Approver Limit Type"::"Direct Approver", 0, '', blankdateformula, true);
        WorkflowSetup.InsertDocApprovalWorkflowSteps(workflow, Buildclaimtypecondition(Book."Approval Status1"::Open), workfloweventhandlingcust.Runworkflowonsendclaimforapprovalcode, Buildclaimtypecondition(Book."Approval Status1"::Pending), workfloweventhandlingcust.RunWorkFlowOncancelClaimForApprovalcode, workflowsteparugument, true);
    end;

    local procedure Buildclaimtypecondition(Status: Integer): Text
    var
        Book: Record "Approval Table";
    begin
        Book.SetRange("Approval Status1", Status);
        exit(StrSubstNo(ClaimTypeCondTxt, WorkflowSetup.Encode(Book.GetView(false))));
    end;

    var
        myInt: Integer;
        WorkflowSetup: Codeunit 1502;
        ClaimWorkflowCategoryTxt: TextConst ENU = 'CDW';
        ClaimWorkflowCategoryDescTxt: TextConst ENU = 'Claim Document';
        ClaimApprovalWorkflowCodeTxt: TextConst ENU = 'CAPW';
        ClaimApprovalWorkfowDescTxt: TextConst ENU = 'Claim Approval Workflow';
        ClaimTypeCondTxt: TextConst ENU = '<?xml version = “1.0” encoding=”utf-8” standalone=”yes”?><ReportParameters><DataItems><DataItem name=”Claim”>%1</DataItem></DataItems></ReportParameters>';

}