codeunit 50402 "User Management ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", 'OnAfterLogin', '', false, false)]
    local procedure sendNotification()
    var
        user: Record User;
        UserPersonalization: Record "User Personalization";
        RolesData: Record "All Profile";
        MyControl: Record "Access Control";
        UserSetting: Record "User Settings";
        sessionSetting: SessionSettings;
        RecRefprofile: Record "All Profile";
    begin

        RolesData.Reset();
        RolesData.SetRange("Profile ID", 'PROPERTYMANAGER');
        if RolesData.FindFirst() then begin
            RecRefprofile := RolesData;
        end;


        UserPersonalization.Init();
        UserPersonalization.Reset();
        UserPersonalization.SetRange("User ID", UserId);
        if UserPersonalization.FindFirst() then begin
            if UserPersonalization."Profile ID" <> 'PROPERTY MANAGER' then begin
                Message('Going to change as property manager');
                UserPersonalization."Profile ID" := RecRefprofile."Profile ID";
                //UserPersonalization.Role := RecRefprofile."Profile ID";
                UserPersonalization.Modify(true);
                Commit();
                // sessionSetting.Init();
                // sessionSetting.ProfileId := RecRefprofile."Profile ID";
                // sessionSetting.RequestSessionUpdate(true);
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