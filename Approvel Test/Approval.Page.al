page 50495 "Approval Page"
{
    PageType = Card;
    SourceTable = "Approval Table";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Submit)
            {
                ApplicationArea = All;
                // Enabled = UserHasPermission();
                trigger OnAction()
                begin
                    SendEmailAndUpdateStatus();
                end;

            }
        }
    }


    var
        myInt: Integer;

    procedure UserHasPermission(): Boolean
    begin
        // Replace this logic with your own criteria for enabling/disabling the action button
        // For example, you can check the current user's ID
        // and return true if they have permission to use the button, false otherwise

        // Replace 'YourUserID' with the actual user ID you want to check
        if UserId = 'RAM' then
            exit(true)
        else
            exit(false);
    end;

    procedure SendEmailAndUpdateStatus()
    var
        approvaltable: Record "Approval Table";
        mail: Codeunit "Email Message";
        email: Codeunit Email;
        HtmlContent: Text;


    // HttpClient: HttpClient;
    // Response: ;
    // Body: Text[1000];
    begin
        // Rec.Get();
        // approvaltable.Get();
        // RecID:=approvaltable.RecordId();
        HtmlContent := '<h1>Hi Kali </h1></br><a target="_blank" href=https://businesscentral.dynamics.com/Sandbox?company=CRONUS%20IN&page=50495&dc=0">Click Here</a>';
        mail.Create('Ram@chandrudemo.onmicrosoft.com', 'this is the subject', HtmlContent, true);
        email.Send(mail);
        Message('Mail send Successfully %1', UserId);
        Rec.Status := Rec.Status::Approved;

    end;

}