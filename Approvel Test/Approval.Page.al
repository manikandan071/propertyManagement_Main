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
                trigger OnAction()
                begin
                    SendEmailAndUpdateStatus();
                end;
            }
        }
    }


    var
        myInt: Integer;

    local procedure SendEmailAndUpdateStatus()
    var
        approvaltable: Record "Approval Table";
        mail: Codeunit "Email Message";
        email: Codeunit Email;
        HtmlContent: Text;
        HttpClient: HttpClient;
        // Response: ;
        Body: Text[1000];
    begin
        HtmlContent := '<h1>Hi Kali </h1></br><a target="_blank" href=https://businesscentral.dynamics.com/Sandbox?company=CRONUS%20IN&page=50495&dc=0">Click Here</a>';
        mail.Create('Ram@chandrudemo.onmicrosoft.com', 'this is the subject', HtmlContent, true);
        email.Send(mail);
        Message('Mail send Successfully');
        Rec.Status := Rec.Status::Approved;
    end;
}