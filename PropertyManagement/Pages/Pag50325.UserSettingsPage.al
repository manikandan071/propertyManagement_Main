page 50325 "User Settings Page"
{
    ApplicationArea = All;
    Caption = 'User Settings Page';
    PageType = List;
    SourceTable = "User Settings";
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
                field(Company; Rec.Company)
                {
                    ToolTip = 'Specifies the value of the Company field.';
                }
                field("Last Login"; Rec."Last Login")
                {
                    ToolTip = 'Specifies the value of the Last Login Info field.';
                }
                field("Locale ID"; Rec."Locale ID")
                {
                    ToolTip = 'Specifies the value of the Locale ID field.';
                }
                field("Profile ID"; Rec."Profile ID")
                {
                    ToolTip = 'Specifies the value of the Profile ID field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("User Security ID"; Rec."User Security ID")
                {
                    ToolTip = 'Specifies the value of the User Security ID field.';
                }
                field("Work Date"; Rec."Work Date")
                {
                    ToolTip = 'Specifies the date that will be entered on transactions, typically today''s date. This change only affects the date on new transactions. Changes to this field will only be valid for the current session.';
                }
            }
        }
    }
}
