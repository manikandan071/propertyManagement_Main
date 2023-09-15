pageextension 50301 "Vendor Card Extension" extends "Vendor Card"
{
    layout
    {
        addlast(General)
        {
            field("Customer Type"; Rec."Vendor Type")
            {
                ApplicationArea = ALL;
            }
        }
    }
}
