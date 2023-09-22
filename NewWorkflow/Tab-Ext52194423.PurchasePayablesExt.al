tableextension 50490 "Purchase&PayablesExt" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50490; "Workflow Header No."; Code[10])
        {
            Caption = 'Workflow Header No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
