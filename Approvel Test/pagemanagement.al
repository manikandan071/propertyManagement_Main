codeunit 50491 pagemanagementext
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', true, true)]
    local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer)
    begin
        if PageID = 0 then
            PageID := getconditionalcardpageid(RecordRef);
    end;

    local procedure getconditionalcardpageid(RecordRef: RecordRef): Integer
    var
        myInt: Integer;
    begin
        case
            RecordRef.Number of
            database::"Approval Table":
                exit(Page::"Approval Page")
        end;
    end;

    var
        myInt: Integer;
}