page 50314 TenantExitCardPage
{
    ApplicationArea = All;
    Caption = 'Tenant Exit Details';
    PageType = Card;
    SourceTable = TenantExitTable;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(ExitNo; Rec.ExitNo)
                {
                    ToolTip = 'Specifies the value of the ExitNo field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group(Property)
            {
                field(PropertyNo; Rec.PropertyNo)
                {
                    ToolTip = 'Specifies the value of the PropertyNo field.';
                }
                field("Property Description"; Rec."Property Description")
                {
                    ToolTip = 'Specifies the value of the PropertyNo field.';
                }
                field("Deposit Amount"; Rec."Deposit Amount")
                {
                    ToolTip = 'Specifies the value of the PropertyNo field.';
                }
            }
            group(Customer)
            {


                field("Tenant No"; Rec."Tenant No")
                {

                }
                field(TenantName; Rec."Tenant Name")
                {

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
                    PropertyDetails.SetRange("Property No", Rec.PropertyNo);
                    if PropertyDetails.FindFirst() AND not Rec.Status then begin
                        PropertyDetails.Status := PropertyDetails.Status::Available;
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
                        Line.Description := 'For ' + Rec."Tenant Name" + ' Deposit Amount returned';
                        Line.Amount := 1 * Rec."Deposit Amount";
                        Line.Validate("Shortcut Dimension 1 Code", 'Sales');
                        GLPost.RunWithCheck(Line);

                        HTmlLink := 'https://businesscentral.dynamics.com/Sandbox?company=CRONUS%20IN&page=50302&dc=0&bookmark=1D_48QAAAJ7_1AAVABOAFUATQAwADAAMQAy';
                        HtmlContent := '<h1>Property ' + Rec."Property Description" + 'Agreement resigned for ' + Rec."Tenant Name" + '</h1><a href=' + HTmlLink + '>Clik here</a>';
                        EmailMessage.Create('Kalimuthu@chandrudemo.onmicrosoft.com', 'Test Subject', HtmlContent, true);
                        SEmail.Send(EmailMessage);
                        Message('Agreement resigned and Deposit Amount return successfully');
                        Rec.Status := true;
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
        if Rec.Status then CurrPage.Editable(false);
    end;

    var
        isAdmin: Boolean;
}
