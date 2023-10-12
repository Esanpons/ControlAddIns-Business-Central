//https://summernote.org/

controladdin "SummerNote"
{
    Scripts =
        'https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js', //https://docs.microsoft.com/en-us/aspnet/ajax/cdn/overview
        'https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote.min.js', //https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/
        'https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-es-ES.js', //https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/
        'https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.5/umd/popper.min.js',   //este revisar en la ultima version cual estan utilizando antes de actualizar
        'https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js', //este revisar en la ultima version cual estan utilizando antes de actualizar
        'EnrichedText-Summernote/src/controlAddIn/summernote/js/ScriptsDescription.js',
        'EnrichedText-Summernote/src/controlAddIn/summernote/js/ScriptsComments.js';

    StyleSheets =
         'https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css', //https://www.bootstrapcdn.com/
         'https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote.min.css', //https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/
          'EnrichedText-Summernote/src/controlAddIn/summernote/css/Style.css';

    StartupScript =
        'EnrichedText-Summernote/src/controlAddIn/summernote/js/Startup.js';

    RequestedHeight = 300;
    MinimumHeight = 1;
    HorizontalStretch = true;

    event ControlAddInReady();

    //funciones y eventos para la parte del Description
    procedure AddNewSummerNoteDescription(Data: Text; JsonMention: JsonArray);
    procedure DisableDescription();
    procedure EnableDescription();
    procedure DestroyDescription();
    procedure GetDataDescription(Data: Text);
    procedure SetDataDescription(Data: Text);
    event OnChangeDescription(Data: Text);
    event MentionDescription(UserMention: JsonObject);


    //funciones y eventos para la parte de Comments
    procedure InitHtmlComments(JsonMention: JsonArray);
    procedure AddNewSummerNoteComments(Data: Text; EntryNo: Integer; OrderNo: Code[20]);
    procedure FinishHtmlComments();
    event OnChangeComments(Data: Text; EntryNo: Integer; OrderNo: Code[20]);
    event MentionComments(UserMention: JsonObject; EntryNo: Integer);

}