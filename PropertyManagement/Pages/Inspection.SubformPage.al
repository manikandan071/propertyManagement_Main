page 50323 "Inspection Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Inspection Lines";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Services; Rec.Services)
                {
                    ApplicationArea = All;
                }
                field("Services Description"; Rec."Inspection Description")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
    end;
}