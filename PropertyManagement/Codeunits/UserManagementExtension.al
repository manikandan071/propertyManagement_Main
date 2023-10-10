codeunit 50402 "User Management ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", 'OnAfterLogin', '', false, false)]
    local procedure sendNotification()
    var
        user: Record User;
        MyRole: Record "User Personalization";
        MyControl: Record "Access Control";
        UserSetting: Record "User Settings";
        sessionSetting: SessionSettings;
    begin
        if user.Get(UserSecurityId) then begin
            // Message('%1 %2 %3', UserId, user."Full Name", user."User Security ID");
            MyControl.SetRange("User Security ID", user."User Security ID");
            if MyControl.FindSet() then begin
                repeat
                    if MyControl."Role ID" = 'RENTMODULE' then begin
                        Message('%1', MyControl."Role ID");
                        UserSetting.SetFilter("User Security ID", user."User Security ID");
                        Message('%1', UserSetting."Profile ID");
                        if UserSetting."Profile ID" = '' then begin
                            Message('%1', UserSetting."Profile ID");

                            // MyRole."Profile ID" := 'PROPERTYMANAGER';
                            // MyRole.Modify(true);
                            // Commit();
                            // UserSetting."Profile ID" := 'PROPERTYMANAGER';
                            // UserSetting.Modify(true);
                            // sessionSetting.Init();
                            // Commit();
                            // sessionSetting.ProfileId := 'PROPERTYMANAGER';
                            // sessionSetting.RequestSessionUpdate(true);
                        end;
                    end;
                until MyControl.Next() = 0;
            end;
        end;
        if MyRole.Get(UserSecurityId) then begin
            // Message('login %1, %2, %3, %4', MyRole."Profile ID", MyRole."Full Name", MyRole."User ID", MyRole.SystemId);
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
}