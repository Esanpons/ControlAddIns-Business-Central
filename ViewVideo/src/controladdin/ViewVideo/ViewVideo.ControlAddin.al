controladdin "ViewVideo"
{
    RequestedHeight = 1000;
    RequestedWidth = 300;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;

    StyleSheets = 'ViewVideo/src/controlAddIn/ViewVideo/css/Style.css';
    Scripts = 'ViewVideo/src/controlAddIn/ViewVideo/js/Script.js',
                'https://code.jquery.com/jquery-3.6.0.min.js';
    StartupScript = 'ViewVideo/src/controlAddIn/ViewVideo/js/Startup.js';
    Images = 'ViewVideo/src/controlAddIn/ViewVideo/html/HtmlHeader.html', 'ViewVideo/src/controlAddIn/ViewVideo/video/VideoEjemplo.mp4';

    event ControlAddInReady();

    procedure CargarVideo();
}