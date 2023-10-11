// codeunit 50489 "User Profile Management"
// {
//     // version BUDGET
//     trigger OnRun()
//     begin
//         UserRolesSelection;
//     end;
//     var UserPersonalization: Record "User Personalization";
//     UserProfilesAssigned: Record "User Profiles Assigned";
//     UserProfilesAssigned2: Record "User Profiles Assigned";
//     UserSetup: Record "User Setup";
//     sessionSetting: SessionSettings;
//     procedure OnInsertUserPersonalization(UserName: Code[50]; var UserProfile: Code[30])
//     begin
//         UserProfilesAssigned.Init;
//         UserProfilesAssigned."User ID":=UserName;
//         UserProfilesAssigned."Profile ID":=UserProfile;
//         if not UserProfilesAssigned2.Get(UserName)then UserProfilesAssigned.Insert(true)
//         else
//         begin
//             UserProfilesAssigned2."Profile ID":=UserProfile;
//             UserProfilesAssigned2.Modify(true);
//         end;
//         //Assign CX Role
//         if StrPos(UserProfile, 'CSO') <> 0 then begin
//             // UsersRec.Reset;
//             // UsersRec.SetCurrentKey("User Name");
//             // UsersRec.SetRange("User Name", UserName);
//             // if UsersRec.FindFirst then begin
//             //     UsersRec.CX := true;
//             //     UsersRec.Modify;        UserSetup.Reset;
//             UserSetup.SetCurrentKey("User ID");
//             UserSetup.SetRange("User ID", UserName);
//             if UserSetup.FindFirst then begin
//                 //UserSetup.CX := true;
//                 UserSetup.Modify;
//             end;
//         end;
//     end;
//     procedure AssignNormalRole()
//     begin
//         if UserPersonalization.Get(UserSecurityId)then begin
//             if UserProfilesAssigned.Get(UserId)then begin
//                 UserPersonalization."Profile ID":=UserProfilesAssigned."Profile ID";
//                 UserPersonalization.Modify(true);
//                 Commit;
//                 sessionSetting.Init();
//                 sessionSetting.ProfileId:=UserProfilesAssigned."Profile ID";
//                 sessionSetting.RequestSessionUpdate(true);
//             end;
//         end;
//         Commit;
//     end;
//     procedure UserRolesSelection()
//     var
//         MyRole: Record "User Personalization";
//     begin
//         if MyRole.Get(UserSecurityId)then begin
//             if(MyRole."Profile ID" <> '')then begin
//                 if((MyRole."Profile ID" <> 'EMPLOYEE SELF SERVICE') and (MyRole."Profile ID" <> 'BUDGET'))then begin
//                     if Confirm(StrSubstNo('Do you want to change your Role from %1 to Self Service?', MyRole."Profile ID"), false) = true then begin
//                         OnInsertUserPersonalization(UserId, MyRole."Profile ID");
//                         AssignSelfService();
//                     end
//                     else
//                         exit;
//                 end
//                 else
//                 begin
//                     if Confirm('Do you want to change your Role from Self Service to your normal role?', false) = true then AssignNormalRole()
//                     else
//                         exit;
//                 end;
//             end
//             else
//             begin
//                 if Confirm('Do you want to change your Role from Self Service to your normal role?', false) = true then AssignNormalRole()
//                 else
//                     exit;
//             end;
//         end;
//     end;
//     procedure AssignSelfService()
//     begin
//         UserPersonalization.Reset();
//         UserPersonalization.SetRange("User ID", UserId);
//         if UserPersonalization.FindFirst then begin
//             UserPersonalization."Profile ID":='EMPLOYEE SELF SERVICE';
//             UserPersonalization.Modify(true);
//             Commit;
//             sessionSetting.Init();
//             sessionSetting.ProfileId:='EMPLOYEE SELF SERVICE';
//             sessionSetting.RequestSessionUpdate(true);
//         end;
//         Commit;
//     end;
// }
