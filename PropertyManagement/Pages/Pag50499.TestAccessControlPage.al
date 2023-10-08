page 50499 TestAccessControlPage
{
    ApplicationArea = All;
    Caption = 'TestAccessControlPage';
    PageType = List;
    SourceTable = "Access Control";
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
                field("App Name"; Rec."App Name")
                {
                    ToolTip = 'Specifies the name of the extension.';
                }
                field("Company Name"; Rec."Company Name")
                {
                    ToolTip = 'Specifies the company that the permission set applies to.';
                }
                field("Role ID"; Rec."Role ID")
                {
                    ToolTip = 'Specifies the ID of a permission set.';
                }
                field("Role Name"; Rec."Role Name")
                {
                    ToolTip = 'Specifies the name of the permission set.';
                }
                field(Scope; Rec.Scope)
                {
                    ToolTip = 'Specifies the value of the Scope field.';
                }
                field("User Name"; Rec."User Name")
                {
                    ToolTip = 'Specifies the name of the user.';
                }
                field("User Security ID"; Rec."User Security ID")
                {
                    ToolTip = 'Specifies the Windows security identification (SID) of each Windows login that has been created in the current database.';
                }
            }
        }
    }
}
