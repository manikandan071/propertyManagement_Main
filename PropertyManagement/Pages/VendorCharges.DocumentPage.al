page 50307 "Vendor Charges"
{
    PageType = Document;
    SourceTable = "Vendor Charges Header";
    Caption = 'Vendor Charges';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Charge No."; Rec."Charge No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Charges No.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Servicer No.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Servicer Name';
                }
                field("Vendor Address"; Rec."Vendor Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Servicer Address';
                }
                field("Vendor Phone"; Rec."Vendor Phone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Servicer Phone';
                }
                field("Vendor Eamil"; Rec."Vendor Eamil")
                {
                    ApplicationArea = All;
                    ToolTip = 'Servicer Email';
                }
            }
            part(lines; "Vendor Charges Subform")
            {
                ApplicationArea = all;
                SubPageLink = "Document No." = field("Charge No."), VendorNumber = field("Vendor No.");
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

                trigger OnAction()
                begin

                end;
            }
        }
    }


    var
        myInt: Integer;
}