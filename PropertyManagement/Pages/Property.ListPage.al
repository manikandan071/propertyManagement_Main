page 50302 "Property List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Property Table1";
    Caption = 'Property List';
    CardPageId = "Property Card Page";
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Property No"; Rec."Property No")
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
                field("Tenant detail"; Rec."Tenant detail")
                {
                    ApplicationArea = All;
                    Caption = 'Tenant detail';
                }
                field("Deposit Amount"; Rec."Deposit Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Deposit Amount';
                }
                field("Rent Amount"; Rec."Rent Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Rent Amount';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
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