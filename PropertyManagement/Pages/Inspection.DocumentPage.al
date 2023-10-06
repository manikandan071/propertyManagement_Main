page 50316 "Inspection Page"
{
    PageType = Document;
    SourceTable = "Inspection Table";
    Caption = 'Inspection';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Inspection  No."; Rec."Inspection No.")
                {
                    ApplicationArea = All;
                }
                field("Property No."; Rec."Property No.")
                {
                    ApplicationArea = All;
                }
                field("Property Description"; Rec."Property Description")
                {
                    ApplicationArea = All;
                }
                field("Assigned By"; Rec."Assigned By1")
                {
                    ApplicationArea = All;
                }
                field("Inspection Status"; Rec."Inspection Status")
                {
                    ApplicationArea = All;
                }
            }
            part(lines; "Inspection Subform")
            {
                ApplicationArea = all;
                SubPageLink = "Document No." = field("Inspection No.");
            }
        }
    }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction()
    //             begin

    //             end;
    //         }
    //     }
    // }
    trigger OnAfterGetRecord()
    begin
        if Rec."Inspection Status" then
            CurrPage.Editable(false);
    end;

    var
        myInt: Integer;
}