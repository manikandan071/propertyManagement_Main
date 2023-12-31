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

                field("Rent No Series"; Rec."Rent No Series")
                {
                    ApplicationArea = All;
                    Caption = 'Rent No.';
                }

                field("Exit No Series"; Rec."Exit No Series")
                {
                    ApplicationArea = All;
                    Caption = 'Exit No Series';
                }
                field("Inspection No Series"; Rec."Inspection No Series")
                {
                    ApplicationArea = All;
                    Caption = 'Inspection No Series';
                }
                field("Maintenance No Series"; Rec."Maintenance No Series")
                {
                    ApplicationArea = All;
                    Caption = 'Maintenance No Series';
                }
                field("Gen. Jrnl No Series"; Rec."Gen. Jrnl No Series")
                {
                    ApplicationArea = All;
                    Caption = 'Gen. Jrnl No Series';
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

