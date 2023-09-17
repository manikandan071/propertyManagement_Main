page 50319 "Maintenance Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Maintenance Lines1";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                }
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = All;
                }
                field("Inspection Description"; Rec."Inspection Description")
                {
                    ApplicationArea = All;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field(Service; Rec.Service)
                {
                    ApplicationArea = All;
                }
                field("Service charge"; Rec."Service charge")
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