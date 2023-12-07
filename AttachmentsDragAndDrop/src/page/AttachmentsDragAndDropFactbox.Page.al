//crs-al disable
// le quito las funciones de la extension de CRS de Waldo para que no modifique el nombre y funcione todo correctamente, ya que depende del nombre que todo valla bien.
page 60015 "AttachmentsDragAndDropFactbox"
{
    Caption = 'Attachments Drag And Drop', Comment = 'ESP="Documentos Adjuntos Drag And Drop"';
    PageType = ListPart;
    UsageCategory = None;
    SourceTable = "Document Attachment";
    InsertAllowed = false;
    ModifyAllowed = false;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            usercontrol(AttachmentsDragAndDrop; "Attachments Drag And Drop")
            {
                ApplicationArea = All;

                trigger ControlAddinReady()
                begin
                    CurrPage.AttachmentsDragAndDrop.InitializeFileDragAndDrop();
                end;

                trigger OnFileUpload(FileName: Text; FileAsText: Text; IsLastFile: Boolean)
                var
                    Base64Convert: Codeunit "Base64 Convert";
                    TempBlob: Codeunit "Temp Blob";
                    RecordRefe: RecordRef;
                    FileInStream: InStream;
                    FileOutStream: OutStream;
                begin
                    TempBlob.CreateOutStream(FileOutStream, TextEncoding::UTF8);
                    Base64Convert.FromBase64(FileAsText.Substring(FileAsText.IndexOf(',') + 1), FileOutStream);
                    TempBlob.CreateInStream(FileInStream, TextEncoding::UTF8);

                    RecordRefe := VariablesSingleInstance.GetRecordRefe();

                    Rec.ID := 0;
                    Rec.SaveAttachmentFromStream(FileInStream, RecordRefe, FileName);

                    if IsLastFile then
                        CurrPage.Update(false);
                end;
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("File Name"; Rec."File Name")
                {
                    ToolTip = 'Specifies the value of the field', comment = 'ESP="Especifica el valor del campo"';
                    ApplicationArea = All;
                }
                field("File Extension"; Rec."File Extension")
                {
                    ToolTip = 'Specifies the value of the field', comment = 'ESP="Especifica el valor del campo"';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(DownloadFile)
            {
                ApplicationArea = All;
                Caption = 'Download File', Comment = 'ESP="Descargar Archivo"';
                ToolTip = 'Download File', Comment = 'ESP="Descargar Archivo"';
                Image = Download;
                Enabled = Rec."File Name" <> '';

                trigger OnAction()
                begin
                    ExportFile(true);
                end;
            }
            action(ViewAttachments)
            {
                ApplicationArea = All;
                Caption = 'View Attachments', Comment = 'ESP="Ver adjuntos"';
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.', Comment = 'ESP="Agregue un archivo como archivo adjunto. Puede adjuntar imágenes y documentos."';
                Image = Attach;

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecordRefe: RecordRef;
                begin
                    Clear(RecordRefe);
                    Clear(DocumentAttachmentDetails);

                    RecordRefe := VariablesSingleInstance.GetRecordRefe();
                    DocumentAttachmentDetails.OpenForRecRef(RecordRefe);
                    DocumentAttachmentDetails.RunModal();

                    VariablesSingleInstance.ClearRecordRefe();
                end;
            }
        }
    }



    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        VariablesSingleInstance.ClearRecordRefe();
    end;

    procedure SetParams(RecVariant: Variant)
    var
        RecordRefe: RecordRef;
    begin
        VariablesSingleInstance.ClearRecordRefe();

        CLEAR(RecordRefe);
        RecordRefe.GETTABLE(RecVariant);
        Rec.InitFieldsFromRecRef(RecordRefe);


    end;

    procedure ExportFile(ShowFileDialog: Boolean): Text
    var
        TempBlob: Codeunit "Temp Blob";
        FileManagement: Codeunit "File Management";
        OutStream: OutStream;
        FullFileName: Text;
    begin
        if Rec.ID = 0 then
            exit;

        if not Rec."Document Reference ID".HasValue then
            exit;

        FullFileName := Rec."File Name" + '.' + Rec."File Extension";
        TempBlob.CreateOutStream(OutStream);
        Rec."Document Reference ID".ExportStream(OutStream);
        exit(FileManagement.BLOBExport(TempBlob, FullFileName, ShowFileDialog));
    end;

    var
        VariablesSingleInstance: Codeunit "Variables SingleInstance";
}
//crs-al enable