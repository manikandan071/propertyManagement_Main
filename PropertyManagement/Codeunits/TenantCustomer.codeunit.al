codeunit 50401 "Tenant Customers"
{
    trigger OnRun()
    begin
        Customer.Init();
        Customer.Reset();
        Customer.SetFilter("Customer Type", 'Tenant');
        CustomerList.SetTableView(Customer);
        CustomerList.Run();
    end;

    var
        Customer: Record Customer;
        CustomerList: Page "Customer List";
}