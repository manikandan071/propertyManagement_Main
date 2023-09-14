page 50303 "Agreement List Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Agreement Table";
    Caption = 'Agreement List';
    CardPageId = "Agreement Card Page";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Agreement No."; Rec."Agreement No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Property Description"; Rec."Property Description")
                {
                    ApplicationArea = All;
                }
                field("Property Deposit Amount"; Rec."Property Deposit Amount")
                {
                    ApplicationArea = All;
                }
                field("Property Owner"; Rec."Property Owner")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction();
    //             begin

    //             end;
    //         }
    //     }
    // }
}