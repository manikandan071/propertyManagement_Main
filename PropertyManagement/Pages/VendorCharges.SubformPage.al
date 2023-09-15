page 50308 "Vendor Charges Subform"
{
    PageType = ListPart;
    SourceTable = "Vendor Charges Lines";
    Caption = 'Charges Lines';
    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies type of the Document No.';
                }
                field("Service Description"; Rec."Service Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies type of the Service Description';
                }
                field("Service Charge"; Rec."Service Charge")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies type of the Service Charge.';
                }
            }
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