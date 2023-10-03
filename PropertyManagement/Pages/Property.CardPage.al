page 50301 "Property Card Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Property Table1";

    layout
    {
        area(Content)
        {
            group(General)
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
                // field("Tenant detail"; Rec."Tenant detail")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Tenant detail';
                // }
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
            group(Tenant)
            {
                Caption = 'Tenant Details';
                field("Tenant No"; Rec."Tenant No")
                {
                    Caption = 'Tenant No.';
                }
                field("Tenant detail"; Rec."Tenant detail")
                {
                    Caption = 'Tenant Name';
                }
            }
        }
        area(FactBoxes)
        {
            part(PropertyPicture; "Property Picture")
            {
                ApplicationArea = All;
                SubPageLink = "Property No." = FIELD("Property No");
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

    //             trigger OnAction()
    //             begin

    //             end;
    //         }
    //     }
    // }

    var
        myInt: Integer;

    trigger OnOpenPage()
    begin
        if Rec.Status = rec.Status::"Agreement Signed" then CurrPage.Editable(false);
    end;
}