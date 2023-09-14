pageextension 50304 "Customer Card Extension" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = ALL;
            }
        }
    }
}
