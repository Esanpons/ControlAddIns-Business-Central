controladdin HelloWorldAddIn
{
    RequestedHeight = 300;
    MinimumHeight = 300;
    MaximumHeight = 300;
    RequestedWidth = 700;
    MinimumWidth = 700;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    StartupScript = 'src\controladdin\HelloWorldAddIn\js\InitScript.js';
    StyleSheets = 'src\controladdin\HelloWorldAddIn\css\StyleSheets.css';
    Scripts = 'src\controladdin\HelloWorldAddIn\js\Scripts.js';

    event CallBack();
    procedure HelloWorld(text: Text);
}