page 50497 "ApprovalExt"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Approval Table";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Request Approval")
            {
                action(Approve)
                {
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    Visible = OpenApprovalEntriesExistCurrUser;
                    Image = Approve;
                    trigger OnAction();
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
            }
            group(Approval)
            {
                action("Send Approval Request")
                {
                    Visible = not OpenApprovalEntriesExist and canRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    trigger OnAction()
                    begin
                        if ApprovalmgmntCut.checkclaimapprovalsworkflowenabled(Rec) then
                            ApprovalmgmntCut.OnSendBookingForApproval(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    Visible = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    trigger OnAction()
                    begin
                        ApprovalmgmntCut.OnCancelBookingForApproval(Rec);
                    end;

                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(rec.RecordId);
        Workflowwebhookmgmnt.GetCanRequestAndCanCancel(Rec.RecordId, canRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;

    var
        OpenApprovalEntriesExistCurrUser,
        OpenApprovalEntriesExist,
        CanCancelApprovalForRecord,
        CanCancelApprovalForFlow
        , HasApprovalEntries,
        canRequestApprovalForFlow : Boolean;
        Workflowwebhookmgmnt: codeunit 1543;
        ApprovalmgmntCut: Codeunit 50496;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";


}