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

    trigger OnOpenPage()
    var
        myInt: Integer;
        user: Record User;
        UserPersonalization: Record "User Personalization";
        RolesData: Record "All Profile";
        RecRefprofile: Code[30];
    begin
        // RolesData.Reset();
        // RolesData.SetRange("Profile ID", 'PROPERTYMANAGER');
        // if RolesData.FindFirst() then begin
        //     RecRefprofile := RolesData."Profile ID";
        //     Message(RecRefprofile);
        // end
    end;
}
