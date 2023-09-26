page 50308 "Vendor Charges Subform"
{
    PageType = ListPart;
    SourceTable = "Vendor Charges Lines New";
    Caption = 'Charges Lines';
    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                // field("Charge Line No."; Rec."Charge Line No.")
                // {
                //     ApplicationArea = All;
                // }
                // field("Document No."; Rec."Document No.")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies type of the Document No.';
                // }
                field(VendorNumber; Rec.VendorNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Vendor No.';
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