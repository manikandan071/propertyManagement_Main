codeunit 50403 "Login Notification"
{
    trigger OnRun()
    var
        Recipients: List of [Text];
        SenderName, SenderID, Subject : Text[100];
        Mail: Codeunit "Email Message";
        Email: Codeunit Email;
        Body, SMSBody : Text;
        CompanyInfo: Record "Company Information";
        // SMS: Codeunit "Notifications Management";
        // SMSPhone, SMSText : Text[250];
        UserSetup: Record "User Setup";
        ActiveSession: Record "Active Session";
    // SMSSource: Code[20];

    begin
        // if GenLedgerSetup.Get then begin
        //     if (GenLedgerSetup."Login Email Notification" or GenLedgerSetup."Login SMS Notification") then begin
        if CompanyInfo.get then begin
            // Message('company');
            // SMSSource := 'LOG_ON_MGT';
            if UserSetup.Get(UserId) then begin
                // Message('userData');
                if UserSetup."E-Mail" <> '' then begin
                    // Message('%1', SessionId());
                    // SMSPhone := UserSetup."Phone No.";
                    SenderName := CompanyInfo.Name;
                    Recipients.Add(UserSetup."E-Mail");
                    Subject := 'Login Management';
                    // if SessionId() <> UserSetup."Current Session" then begin
                    ActiveSession.Reset();
                    ActiveSession.SetRange("Session ID", SessionId());
                    if ActiveSession.FindFirst() then begin
                        // Message('%1', ActiveSession."Session ID");
                        Body := '';
                        Body += 'Dear ' + UserId;
                        Body += '<BR><BR>';
                        Body += ' You have logged into Dynamics 365 Business Central';
                        Body += '<BR> Log In Time ' + format(ActiveSession."Login Datetime");
                        SMSBody := '';
                        SMSBody += 'Dear ' + UserId;
                        SMSBody += ' You have logged into Dynamics 365 Business Central ';
                        SMSBody += 'Log In Time ' + format(ActiveSession."Login Datetime");
                        Mail.Create(Recipients, Subject, Body, true);
                        Email.Send(Mail);
                    end;

                    // if GuiAllowed then begin
                    // if GenLedgerSetup."Login Email Notification" then begin
                    // Mail.Create(Recipients, Subject, Body, true);
                    // Email.Send(Mail);
                    // end;
                    // SMSText := SMSBody;
                    // if GenLedgerSetup."Login SMS Notification" then SMS.SendSms(SMSPhone, SMSText, SMSSource);
                    // UserSetup."Current Session" := SessionId();
                    // UserSetup.Modify;
                    // end;
                    // end;
                end;
            end;
        end;
        //     end;
        // end;
    end;

    var
        myInt: Integer;
        GenLedgerSetup: Record "General Ledger Setup";
}