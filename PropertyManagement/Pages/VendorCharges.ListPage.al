page 50306 "Vendor Charges List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Vendor Charges Header";
    Caption = 'Vendor Charges List';
    Editable = false;
    CardPageId = "Vendor Charges";
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Charge No."; Rec."Charge No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Charges No.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Vendor No.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}