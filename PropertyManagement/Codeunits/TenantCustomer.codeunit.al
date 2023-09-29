codeunit 50401 "Tenant Customers"
{
    trigger OnRun()
    begin
        Customer.Init();
        Customer.Reset();
        Customer.SetFilter("Customer Type", 'Tenant');
        if Customer.FindSet() then begin
            repeat
                Message('%1', Customer.Name);
            until Customer.Next() = 0;
        end;
        ;
        CustomerList.SetTableView(Customer);
        CustomerList.Run();
    end;

    var
        Customer: Record Customer;
        CustomerList: Page "Customer List";
}