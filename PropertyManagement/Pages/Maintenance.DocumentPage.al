page 50318 "Maintenace Page"
{
    PageType = Document;
    SourceTable = "Maintenance Header";
    Caption = 'Maintenace';
    layout
    {
        area(Content)
        {
            group(General)
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
                field("Property Owner"; Rec."Property Owner")
                {
                    ApplicationArea = All;
                }
            }
            part(lines; "Maintenance Subform")
            {
                ApplicationArea = all;
                SubPageLink = "Document No" = field("Manitenance No.");
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

}