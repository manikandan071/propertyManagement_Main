page 50322 "Rent Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Rent Lines";
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Paid Amount"; Rec."Paid Amount")
                {
                    ApplicationArea = All;
                }
                field("Remining Amount"; Rec."Remining Amount")
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

    //             trigger OnAction();
    //             begin

    //             end;
    //         }
    //     }
    // }


    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
    end;
}