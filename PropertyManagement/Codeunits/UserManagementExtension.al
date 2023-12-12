codeunit 50402 "User Management ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", 'OnAfterLogin', '', false, false)]
    local procedure sendNotification()
    var
        UserPersonalization: Record "User Personalization";
        sessionSetting: SessionSettings;
        AccessContral: Record "Access Control";
        RoleCenter: Page PropertyManagementRoleCenter;
        Notification: Codeunit "Login Notification";
    begin
        UserPersonalization.Init();
        UserPersonalization.Reset();
        UserPersonalization.SetRange("User ID", UserId);
        if UserPersonalization.FindFirst() then begin
            // Message('%1', UserPersonalization."Profile ID");
            AccessContral.SetRange("User Security ID", UserSecurityId());
            if AccessContral.FindSet() then begin
                repeat
                    if AccessContral."Role ID" = 'RENTACCOUNTANT' then begin
                        // Message('%1', UserPersonalization."Profile ID");
                        if UserPersonalization."Profile ID" <> 'RENTACCOUNTANT' then begin
                            UserPersonalization."Profile ID" := 'RENTACCOUNTANT';
                            UserPersonalization."App ID" := AccessContral."App ID";
                            UserPersonalization.Modify(true);
                            Notification.Run();
                            // sessionSetting.Init();
                            // sessionSetting.ProfileId := 'PROPERTYMANAGER';
                            // sessionSetting.RequestSessionUpdate(true);
                        end;
                    end
                    else
                        if AccessContral."Role ID" = 'PROPERTYSALESMAN' then begin
                            // Message('%1', UserPersonalization."Profile ID");
                            if UserPersonalization."Profile ID" <> 'PROPERTYSALESMAN' then begin
                                UserPersonalization."Profile ID" := 'PROPERTYSALESMAN';
                                UserPersonalization."App ID" := AccessContral."App ID";
                                UserPersonalization.Modify(true);
                                Notification.Run();
                                // sessionSetting.Init();
                                // sessionSetting.ProfileId := 'PROPERTYMANAGER';
                                // sessionSetting.RequestSessionUpdate(true);
                            end;
                        end
                        else
                            if AccessContral."Role ID" = 'PROPERTYMAINTENANCE' then begin
                                // Message('%1', UserPersonalization."Profile ID");
                                if UserPersonalization."Profile ID" <> 'MAINTENANCEMANAGER' then begin
                                    UserPersonalization."Profile ID" := 'MAINTENANCEMANAGER';
                                    UserPersonalization."App ID" := AccessContral."App ID";
                                    UserPersonalization.Modify(true);
                                    Notification.Run();
                                    // sessionSetting.Init();
                                    // sessionSetting.ProfileId := 'PROPERTYMANAGER';
                                    // sessionSetting.RequestSessionUpdate(true);
                                end;
                            end;
                until AccessContral.Next() = 0;
            end;
            // Page.Run(Page::PropertyManagementRoleCenter);
            // RoleCenter.Run();
            // RoleCenter.update(true);
        end;
        // Notification.Run();
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