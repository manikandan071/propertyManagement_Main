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

    trigger OnOpenPage()
    var
        UserPermission: Record "Access Control";
    begin
        UserPermission.SetRange("User Security ID", UserSecurityId());
        UserPermission.SetFilter("Role ID", 'TESTSET');
        // if UserPermission.IsEmpty() then begin
        //     Error('You are not a part of admin..');
        // end;
    end;
}
