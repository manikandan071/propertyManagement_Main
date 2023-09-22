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

                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
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
        area(processing)
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
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


                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval to change the record.';
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()

                    var
                        CustomWorkflowMgmt: Codeunit "Booking Workflow Mgmnt";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        if CustomWorkflowMgmt.CheckApprovalsWorkflowEnabled(RecRef) then
                            CustomWorkflowMgmt.OnSendWorkflowForApproval(RecRef);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        CustomWorkflowMgmt: Codeunit "Booking Workflow Mgmnt";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        CustomWorkflowMgmt.OnCancelWorkflowForApproval(RecRef);
                    end;
                }
            }
        }
        area(Creation)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = OpenApprovalEntriesExistCurrUser;
                    trigger OnAction()
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistCurrUser;
                    Promoted = true;
                    PromotedCategory = New;
                    trigger OnAction()
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistCurrUser;
                    Promoted = true;
                    PromotedCategory = New;
                    trigger OnAction()

                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistCurrUser;
                    Promoted = true;

                    PromotedCategory = New;


                    trigger OnAction()
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = All;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'View approval requests.';
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = HasApprovalEntries;
                    trigger OnAction()
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }

    }

    trigger OnAfterGetCurrRecord()
    begin
        OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        HasApprovalEntries := ApprovalsMgmt.HasApprovalEntries(Rec.RecordId);
    end;

    var
        OpenApprovalEntriesExistCurrUser, OpenApprovalEntriesExist, CanCancelApprovalForRecord
        , HasApprovalEntries : Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}
