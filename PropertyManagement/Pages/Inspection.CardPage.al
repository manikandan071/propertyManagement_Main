page 50316 "Inspection Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Inspection Table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Inspection  No."; Rec."Inspection  No.")
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
                field("Maintenance Description"; Rec."Maintenance Description")
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