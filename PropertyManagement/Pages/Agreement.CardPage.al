page 50304 "Agreement Card Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Agreement Table";

    layout
    {
        area(Content)
        {
            group(General)
            {

                field("Agreement No."; Rec."Agreement No.")
                {
                    ApplicationArea = All;
                    Caption = 'Agreement No.';
                }
                field("Agreement Sign"; Rec."Agreement Sign")
                {
                    ApplicationArea = All;
                    Caption = 'Agreement Sign Completed';
                }
            }
            group(Customer)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Address';
                }
                field("Customer Phone"; Rec."Customer Phone")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Phone';
                }
                field("Customer Mail"; Rec."Customer Mail")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Mail';
                }
            }
            group(Property)
            {
                field("Property No."; Rec."Property No.")
                {
                    ApplicationArea = All;
                    Caption = 'Property No.';
                }
                field("Property Description"; Rec."Property Description")
                {
                    ApplicationArea = All;
                    Caption = 'Property Description';
                }
                field("Property Owner"; Rec."Property Owner")
                {
                    ApplicationArea = All;
                    Caption = 'Property Owner';
                }
                field("Property Deposit Amount"; Rec."Property Deposit Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Property Deposit Amount';
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
                    Rec."Agreement Sign" := true;
                    PropertyList.Init();
                    PropertyList.Reset();
                    PropertyList.SetFilter(PropertyList."Property No", Rec."Property No.");
                    if PropertyList.FindSet() then begin
                        PropertyList."Tenant detail" := Rec."Customer No.";
                        PropertyList.Status := PropertyList.Status::"Agreement Signed";
                        PropertyList.Modify();
                        Message('Property No. %1', PropertyList."Property No");
                    end;
                end;
            }

            // action(Testing)
            // {
            //     ApplicationArea = All;

            //     trigger OnAction()
            //     var
            //         VarInteger: Integer;
            //         VarDate: Date;
            //         VarYesNo: Boolean;
            //         VarDuration: Duration;
            //         Value: Text;
            //         Ok1: Boolean;
            //         Ok2: Boolean;
            //         Ok3: Boolean;
            //         Ok4: Boolean;
            //         Text000: Label 'VarInteger = \#1\#\#\#\#\#\#. The return code is: %2.\\';
            //         Text001: Label 'VarDate = \#3\#\#\#\#\#\#. The return code is: %4.\\';
            //         Text002: Label 'VarYesNo = \#5\#\#\#\#\#\#. The return code is: %6.\\';
            //         Text003: Label 'VarDuration = %7. The return code is: %8.';
            //     begin
            //         Value := '19960101';
            //         Ok1 := Evaluate(VarInteger, Value);
            //         Ok2 := Evaluate(VarDate, Value);
            //         Ok3 := Evaluate(VarYesNo, Value);
            //         Value := '2days 4hours 3.7 seconds 17 milliseconds';
            //         Ok4 := Evaluate(VarDuration, Value);
            //         Message(Text000 + Text001 + Text002 + Text003, VarInteger, Ok1, VarDate, Ok2, VarYesNo, Ok3, VarDuration, Ok4);
            //     end;
            // }

            action(SendEmail)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    SEmail: Codeunit Email;
                    EmailMessage: Codeunit "Email Message";
                    HtmlContent: Text;
                    HTmlLink: Text;
                begin

                    // Message('https://businesscentral.dynamics.com/Sandbox?company=CRONUS%20IN&page=50304&dc=0&bookmark=%1', Rec.RecordId);
                    HTmlLink := 'https://businesscentral.dynamics.com/Sandbox?company=CRONUS%20IN&page=50304&dc=0&bookmark=17_4sQAAAJ7_0EATgAwADAAMAAx';
                    HtmlContent := '<h1>Please approve this test data</h1><a href=' + HTmlLink + '>Clik here</a>';
                    EmailMessage.Create('Kalimuthu@chandrudemo.onmicrosoft.com', 'Test Subject', HtmlContent, true);
                    SEmail.Send(EmailMessage);
                    Message('Mail sent successfully');
                end;
            }

            action(Approve)
            {
                ApplicationArea = All;
                Visible = isAdmin;
                trigger OnAction()
                var
                    PropertyDetails: Record "Property Table1";
                begin
                    PropertyDetails.Init();
                    PropertyDetails.Reset();
                    PropertyDetails.SetRange("Property No", Rec."Property No.");
                    if PropertyDetails.FindFirst() then begin
                        PropertyDetails.Status := PropertyDetails.Status::"Agreement Signed";
                        PropertyDetails.Modify();
                        Message('Approved');
                    end;
                end;
            }
        }


    }

    trigger OnOpenPage()
    var
        userID: Text;
        ApprovalUsers: Record "User Setup";

    begin
        userID := Database.UserId();
        isAdmin := false;
        ApprovalUsers.Init();
        ApprovalUsers.Reset();
        ApprovalUsers.SetRange("User ID", userID);
        if ApprovalUsers.FindFirst() then begin
            if ApprovalUsers."User ID" = userID then begin
                isAdmin := true;
            end;
        end;
    end;

    var
        myInt: Integer;
        isAdmin: Boolean;
}