controladdin "EnrichedText"
{
    RequestedHeight = 350;
    VerticalStretch = true;
    HorizontalStretch = true;
    Scripts = 'src/controladdin/EnrichedText/js/ckeditor.js', 'src/controladdin/EnrichedText/js/Script.js';
    StartupScript = 'src/controladdin/EnrichedText/js/InitScript.js';
    StyleSheets = 'src/controladdin/EnrichedText/css/Stylesheets.css';

    event ControlReady();
    event SaveRequested(data: Text);
    event ContentChanged();
    event OnAfterInit();

    procedure Init();
    procedure Load(data: Text);
    procedure RequestSave();

}

