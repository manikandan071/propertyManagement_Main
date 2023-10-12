page 50325 "User Settings Page"
{
    ApplicationArea = All;
    Caption = 'User Settings Page';
    PageType = List;
    SourceTable = "User Personalization";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("App ID"; Rec."App ID")
                {
                    ToolTip = 'Specifies the value of the App ID field.';
                }
                field(Profile; Rec."Profile ID")
                {
                    ToolTip = 'Specifies the value of the Company field.';
                }
                field("User ID"; Rec."User ID")
                {

                }
                field(Role; Rec.Role)
                {

                }
            }

        }
    }

    actions
    {
        area(Creation)
        {
            // group(TestGroup)
            // {
            action(ChangeSession)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //usermgmnt.Run()
                end;
                //}
            }
        }
    }



    trigger OnOpenPage()
    var
        UserPersonalization: Record "User Personalization";
        sessionSetting: SessionSettings;
    begin


        // UserPersonalization.Init();
        // UserPersonalization.Reset();
        // UserPersonalization.SetRange("User ID", UserId);
        // if UserPersonalization.FindFirst() then begin
        //     Message(UserPersonalization."Profile ID");
        //     if UserPersonalization."Profile ID" <> 'PROPERTYMANAGER' then begin
        //         Message('Going to change as property manager as new');
        //         UserPersonalization."Profile ID" := 'PROPERTYMANAGER';
        //         UserPersonalization."App ID" := '{831712C8-B7FB-4EFE-B90F-2011CE925325}';
        //         UserPersonalization.Modify(true);
        //         commit();
        //         sessionSetting.Init();
        //         sessionSetting.ProfileId := 'PROPERTYMANAGER';
        //         sessionSetting.RequestSessionUpdate(true);
        //     end;
        // end;
    end;

    var
        usermgmnt: Codeunit "User Management ext";
}
