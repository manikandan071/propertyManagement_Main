page 50317 "Maintenance List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Maintenance Header";
    CardPageId = "Maintenace Page";
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Manitenance No."; Rec."Manitenance No.")
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