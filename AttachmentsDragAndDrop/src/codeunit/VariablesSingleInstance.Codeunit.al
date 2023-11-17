//crs-al disable
// le quito las funciones de la extension de CRS de Waldo para que no modifique el nombre y funcione todo correctamente, ya que depende del nombre que todo valla bien.
codeunit 60001 "Variables SingleInstance"
{
    SingleInstance = true;

    #region CELAR
    procedure ClearRecordRefe()
    begin
        Clear(RecordRefe);
    end;
    #endregion

    #region SET
    procedure SetRecordRefe(l_RecordRefe: RecordRef)
    begin
        ClearRecordRefe();
        RecordRefe := l_RecordRefe;
    end;
    #endregion

    #region GET
    procedure GetRecordRefe(): RecordRef
    begin
        exit(RecordRefe);
    end;
    #endregion
    var
        RecordRefe: RecordRef;
}
//crs-al enable