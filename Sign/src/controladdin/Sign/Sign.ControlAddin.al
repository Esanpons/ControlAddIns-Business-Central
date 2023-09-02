
controladdin "Sign"
{
    Scripts =
        'https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js', //https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js
        'https://cdnjs.cloudflare.com/ajax/libs/signature_pad/1.5.3/signature_pad.min.js',
        'Sign/src/controlAddIn/Sign/js/Scripts.js';

    StyleSheets =
          'Sign/src/controlAddIn/Sign/css/Style.css';

    StartupScript =
        'Sign/src/controlAddIn/Sign/js/Startup.js';

    Images = 'Sign/src/controlAddIn/Sign/html/HtmlSign.html';

    RequestedHeight = 350;
    MinimumHeight = 1;
    MinimumWidth = 250;
    HorizontalShrink = true;
    HorizontalStretch = true;

    procedure Init();
    event ControlAddInReady();

    event SaveSign(Base64Sign: Text);


}