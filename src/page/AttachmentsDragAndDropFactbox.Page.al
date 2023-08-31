//crs-al disable
// le quito las funciones de la extension de CRS de Waldo para que no modifique el nombre y funcione todo correctamente, ya que depende del nombre que todo valla bien.
page 81700 "AttachmentsDragAndDropFactbox"
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
                    FileInStream: InStream;
                    FileOutStream: OutStream;
                begin
                    TempBlob.CreateOutStream(FileOutStream, TextEncoding::UTF8);
                    Base64Convert.FromBase64(FileAsText.Substring(FileAsText.IndexOf(',') + 1), FileOutStream);
                    TempBlob.CreateInStream(FileInStream, TextEncoding::UTF8);

                    Rec.ID := 0;
                    Rec.SaveAttachmentFromStream(FileInStream, GetSourceRecRef(), FileName);

                    if IsLastFile then
                        CurrPage.Update(false);
                end;
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Name field.';
                }
                field("File Extension"; Rec."File Extension")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Extensions field.';
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
                Caption = 'Download File';
                ToolTip = 'Download File';
                Image = Download;
                Enabled = Rec."File Name" <> '';
                trigger OnAction()
                begin
                    ExportFile(true);
                end;
            }
        }
    }

    local procedure GetSourceRecRef(): RecordRef
    var
        RecordRefe: RecordRef;
        FieldRefNo: FieldRef;
        TableNo: Integer;
        TablePK: Text;
    begin
        Rec.FilterGroup(4);
        Evaluate(TableNo, Rec.GetFilter("Table ID"));
        Evaluate(TablePK, Rec.GetFilter("No."));
        RecordRefe.Open(TableNo);
        FieldRefNo := RecordRefe.Field(1);
        FieldRefNo.SetRange(TablePK);
        RecordRefe.FindFirst();
        Rec.FilterGroup(0);
        exit(RecordRefe);
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
}
//crs-al enable