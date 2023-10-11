codeunit 50402 "User Management ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", 'OnAfterLogin', '', false, false)]
    local procedure sendNotification()
    var
        UserPersonalization: Record "User Personalization";
        sessionSetting: SessionSettings;
    begin
        UserPersonalization.Init();
        UserPersonalization.Reset();
        UserPersonalization.SetRange("User ID", UserId);
        if UserPersonalization.FindFirst() then begin
            if UserPersonalization."Profile ID" <> 'PROPERTYMANAGER' then begin


                UserPersonalization."Profile ID" := 'PROPERTYMANAGER';
                UserPersonalization."App ID" := '{831712C8-B7FB-4EFE-B90F-2011CE925325}';
                UserPersonalization.Modify(true);


                sessionSetting.Init();
                sessionSetting.ProfileId := 'PROPERTYMANAGER';
                sessionSetting.RequestSessionUpdate(true);


            end;
        end;
    end;

    local procedure MyProcedure()
    begin

    end;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
        UserSetup: Record "User Setup";
}