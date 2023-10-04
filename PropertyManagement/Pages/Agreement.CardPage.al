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
                field("Gen. Jrnl Document no"; Rec."Gen. Jrnl Document no")
                {
                    ApplicationArea = All;
                    Caption = 'Gen Jrnl No';
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
        }
    }

    actions
    {
        area(Processing)
        {
            // action(Submit)
            // {
            //     ApplicationArea = All;

            //     trigger OnAction()
            //     var
            //         PropertyList: Record "Property Table1";
            //     begin
            //         Rec."Agreement Sign" := true;
            //         PropertyList.Init();
            //         PropertyList.Reset();
            //         PropertyList.SetFilter(PropertyList."Property No", Rec."Property No.");
            //         if PropertyList.FindSet() then begin
            //             PropertyList."Tenant detail" := Rec."Customer No.";
            //             PropertyList.Status := PropertyList.Status::"Agreement Signed";
            //             PropertyList.Modify();
            //             Message('Property No. %1', PropertyList."Property No");
            //         end;
            //     end;
            // }

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

            // action(SendEmail)
            // {
            //     ApplicationArea = All;

            //     trigger OnAction()
            //     var
            //         SEmail: Codeunit Email;
            //         EmailMessage: Codeunit "Email Message";
            //         HtmlContent: Text;
            //         HTmlLink: Text;
            //     begin

            //         // Message('https://businesscentral.dynamics.com/Sandbox?company=CRONUS%20IN&page=50304&dc=0&bookmark=%1', Rec.RecordId);
            //         HTmlLink := 'https://businesscentral.dynamics.com/Sandbox?company=CRONUS%20IN&page=50304&dc=0&bookmark=17_4sQAAAJ7_0EATgAwADAAMAAx';
            //         HtmlContent := '<h1>Please approve this test data</h1><a href=' + HTmlLink + '>Clik here</a>';
            //         EmailMessage.Create('Kalimuthu@chandrudemo.onmicrosoft.com', 'Test Subject', HtmlContent, true);
            //         SEmail.Send(EmailMessage);
            //         Message('Agreement Assigned successfully');
            //     end;
            // }

            action(Submit)
            {
                ApplicationArea = All;
                Visible = isAdmin;
                trigger OnAction()
                var
                    PropertyDetails: Record "Property Table1";
                    SEmail: Codeunit Email;
                    EmailMessage: Codeunit "Email Message";
                    HtmlContent: Text;
                    HTmlLink: Text;
                    GLPost: Codeunit "Gen. Jnl.-Post Line";
                    Line: Record "Gen. Journal Line";
                begin
                    PropertyDetails.Init();
                    PropertyDetails.Reset();
                    PropertyDetails.SetRange("Property No", Rec."Property No.");
                    if PropertyDetails.FindFirst() AND not Rec."Agreement Sign" then begin
                        PropertyDetails.Status := PropertyDetails.Status::"Agreement Signed";
                        PropertyDetails.Modify();

                        Line.Init();
                        Line."Posting Date" := Today();
                        Line."Document Type" := Line."Document Type"::Payment;
                        Line."Document No." := Rec."Gen. Jrnl Document no";
                        Line."Account Type" := Line."Account Type"::"G/L Account";
                        Line."Account No." := '9514';
                        // Line."Applies-to Doc. Type" := Line."Applies-to Doc. Type"::Invoice;
                        // Line."Applies-to Doc. No." := Rec."Invoice No";
                        Line."Bal. Account Type" := Line."Bal. Account Type"::"Bank Account";
                        Line."Bal. Account No." := 'B030';
                        Line.Description := 'For ' + Rec."Customer Name" + ' Deposit Amount';
                        Line.Amount := -1 * Rec."Property Deposit Amount";
                        Line.Validate("Shortcut Dimension 1 Code", 'Sales');
                        GLPost.RunWithCheck(Line);

                        HTmlLink := 'https://businesscentral.dynamics.com/Sandbox?company=CRONUS%20IN&page=50302&dc=0&bookmark=1D_48QAAAJ7_1AAVABOAFUATQAwADAAMQAy';
                        HtmlContent := '<h1>Property ' + Rec."Property Description" + 'Agreement signed for ' + Rec."Customer Name" + '</h1><a href=' + HTmlLink + '>Clik here</a>';
                        EmailMessage.Create('Kalimuthu@chandrudemo.onmicrosoft.com', 'Test Subject', HtmlContent, true);
                        SEmail.Send(EmailMessage);
                        Message('Agreement Assigned and Deposit Amount Paid successfully');
                        Rec."Agreement Sign" := true;
                        Rec.Modify();
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
        if Rec."Agreement Sign" then CurrPage.Editable(false);
    end;

    var
        myInt: Integer;
        isAdmin: Boolean;
}