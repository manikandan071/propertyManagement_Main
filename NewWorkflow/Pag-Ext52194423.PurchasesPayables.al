pageextension 50490 "Purchases&Payables" extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Posted Invoice Nos.")
        {
            field("Workflow Header No."; Rec."Workflow Header No.")
            {
                ApplicationArea = All;

            }
        }
    }
}
