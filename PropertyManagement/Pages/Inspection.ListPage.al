page 50315 "Inspection List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Inspection Table";
    Caption = 'Inspection List';
    CardPageId = "Inspection Page";
    layout
    {
        area(Content)
        {
            repeater(GroupName)
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