
//crs-al disable
// le quito las funciones de la extension de CRS de Waldo para que no modifique el nombre y funcione todo correctamente, ya que depende del nombre que todo valla bien.
controladdin "Attachments Drag And Drop"
{
    Scripts = 'https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js',
        'src\controladdin\AttachmentsDragAndDrop\js\scripts.js';
    StartupScript = 'src\controladdin\AttachmentsDragAndDrop\js\startup.js';

    RequestedHeight = 1;
    MinimumHeight = 1;
    HorizontalStretch = true;

    event ControlAddinReady();
    event OnFileUpload(FileName: Text; FileAsText: Text; IsLastFile: Boolean)
    procedure InitializeFileDragAndDrop()
}
//crs-al enable