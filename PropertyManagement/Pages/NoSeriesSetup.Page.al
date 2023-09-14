page 50300 "No series Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "No Series Setup";
    Caption = 'No series Setup';
    // DeleteAllowed = false;
    // InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Property No Series"; Rec."Property No Series")
                {
                    ApplicationArea = All;
                    Caption = 'Property No.';
                }
                field("Booking No Series"; Rec."Booking No Series")
                {
                    ApplicationArea = All;
                    Caption = 'Booking No.';
                }
                field("Agreement No Series"; Rec."Agreement No Series")
                {
                    ApplicationArea = All;
                    Caption = 'Agreement No.';
                }
                field("Charges No Series"; Rec."Charges No Series")
                {
                    ApplicationArea = All;
                    Caption = 'Charges No.';
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

    var
        myInt: Integer;
}