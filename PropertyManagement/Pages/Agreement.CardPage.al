page 50304 "Agreement Card Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Agreement Table";

    layout
    {
        area(Content)
        {
            group(General)
            {

                field("Agreement No."; Rec."Agreement No.")
                {
                    ApplicationArea = All;
                    Caption = 'Agreement No.';
                }
            }
            group(Customer)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Address';
                }
                field("Customer Phone"; Rec."Customer Phone")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Phone';
                }
                field("Customer Mail"; Rec."Customer Mail")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Mail';
                }
            }
            group(Property)
            {
                field("Property No."; Rec."Property No.")
                {
                    ApplicationArea = All;
                    Caption = 'Property No.';
                }
                field("Property Description"; Rec."Property Description")
                {
                    ApplicationArea = All;
                    Caption = 'Property Description';
                }
                field("Property Owner"; Rec."Property Owner")
                {
                    ApplicationArea = All;
                    Caption = 'Property Owner';
                }
                field("Property Deposit Amount"; Rec."Property Deposit Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Property Deposit Amount';
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