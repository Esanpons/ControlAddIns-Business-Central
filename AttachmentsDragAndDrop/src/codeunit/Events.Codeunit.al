codeunit 60000 "Events"
{
    #region EVENTOS
    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", OnAfterInitFieldsFromRecRef, '', true, true)]
    local procedure T1173_OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        VariablesSingleInstance: Codeunit "Variables SingleInstance";
    begin
        VariablesSingleInstance.SetRecordRefe(RecRef);
    end;
    #endregion

}