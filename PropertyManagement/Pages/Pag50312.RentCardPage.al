page 50312 RentCardPage
{
    ApplicationArea = All;
    Caption = 'Rent Details';
    PageType = Card;
    SourceTable = RentTable;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(RentNo; Rec.RentNo)
                {
                    ToolTip = 'Specifies the value of the RentNo field.';
                }
                field(PropertyNo; Rec.PropertyNo)
                {
                    ToolTip = 'Specifies the value of the PropertyNo field.';
                }

                field(RentAmount; Rec.RentAmount)
                {
                    ToolTip = 'Specifies the value of the Rent Amount field.';
                }
                field("Tenant No."; Rec."Tenant No.")
                {
                    ToolTip = 'Specifies the value of the Tenant field.';
                }
                field("Tenant detail"; Rec."Tenant detail")
                {
                    ToolTip = 'Specifies the value of the Tenant field.';
                }

            }
            group(Payments)
            {
                Caption = 'Payment';
                field("Invoice No"; Rec."Invoice No")
                {
                    ToolTip = 'Specifies the Invoice No.';
                }
                field(Ispayment; Rec.Ispayment)
                {
                    ToolTip = 'Specifies the Payment Checking';
                    Editable = false;
                }

                field("Date Of Paid"; Rec."Date Of Paid")
                {
                    ToolTip = 'Specifies the value of the Date Of Paid field.';
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Payment)
            {
                ApplicationArea = All;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction();

                var
                    GLPost: Codeunit "Gen. Jnl.-Post Line";
                    Line: Record "Gen. Journal Line";
                    // OrderLines: Record "Order Line Table";
                    GenJnlBatch: Record "Gen. Journal Batch";
                    NoSeriesMgt: Codeunit NoSeriesManagement;
                    CusledgerEntry: Record "Cust. Ledger Entry";
                begin

                    if Rec."Invoice No" <> '' then begin
                        CusledgerEntry.Init();
                        CusledgerEntry.SetFilter("Document No.", Rec."Invoice No");
                        if CusledgerEntry.FindSet() then begin
                            // CusledgerEntry."Applies-to ID" := OrderLines."Gen. Jrnl Document no";
                            Message('Cus ledger Entry %1,%2,%3,%4,%5', CusledgerEntry."Document Type", CusledgerEntry."Document No.", CusledgerEntry."Customer No.", CusledgerEntry."Sales (LCY)");

                            if not Rec.Ispayment then begin
                                Message('this is order lines %1,%2,%3,%4', Rec."Gen. Jrnl Document no", Rec.RentAmount, Rec."Tenant No.", Rec."Invoice No");
                                Line.Init();
                                Line."Posting Date" := Today();
                                Line."Document Type" := Line."Document Type"::Payment;
                                Line."Document No." := Rec."Gen. Jrnl Document no";
                                Line."Account Type" := Line."Account Type"::Customer;
                                Line."Account No." := Rec."Tenant No.";
                                Line."Applies-to Doc. Type" := Line."Applies-to Doc. Type"::Invoice;
                                Line."Applies-to Doc. No." := Rec."Invoice No";
                                Line."Bal. Account Type" := Line."Bal. Account Type"::"Bank Account";
                                Line."Bal. Account No." := 'Savings';
                                Line.Description := 'My Payment Journals';
                                Line.Amount := -1 * Rec.RentAmount;
                                Line.Validate("Shortcut Dimension 1 Code", 'Sales');
                                GLPost.RunWithCheck(Line);
                                // OrderLines.Get(OrderLines."Line No.");
                                Rec.Ispayment := true;
                                Rec."Date Of Paid" := Today;
                                // rec.Status := true;
                                Rec.Modify();
                            end
                            else
                                Message('Already Posted');
                        end;
                    end
                    else
                        Message('Enter Invoice No.');
                end;
            }
        }
    }
    trigger OnOpenPage()

    begin
        if Rec.Ispayment = true then begin
            CurrPage.Editable(false);
        end
        else begin
        end;
    end;


    local procedure PostGenJnlforRent()
    var
        GLPost: Codeunit "Gen. Jnl.-Post Line";
        Line: Record "Gen. Journal Line";
        GenJnlBatch: Record "Gen. Journal Batch";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin

        if not Rec.Ispayment then begin
            Line.Init();
            Line."Posting Date" := Today();
            Line."Document Type" := Line."Document Type"::Payment;
            Line."Document No." := Rec."Gen. Jrnl Document no";
            Line."Account Type" := Line."Account Type"::"G/L Account";
            Line."Account No." := '9511';
            //Line."Applies-to Doc. Type" := Line."Applies-to Doc. Type"::Invoice;
            //Line."Applies-to Doc. No." := Rec."Invoice No";
            Line."Bal. Account Type" := Line."Bal. Account Type"::"Bank Account";
            Line."Bal. Account No." := 'Savings';
            Line.Description := 'My Payment Journals';
            Line.Amount := -1 * Rec.RentAmount;
            Line.Validate("Shortcut Dimension 1 Code", 'Sales');
            GLPost.RunWithCheck(Line);
            // OrderLines.Get(OrderLines."Line No.");
            Rec.Ispayment := true;
            Rec."Date Of Paid" := Today;
            // rec.Status := true;
            Rec.Modify();
        end

    end;

}
