controladdin "HelloWorldAddIn"
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
    StartupScript = 'HelloWorld\src\controladdin\HelloWorldAddIn\js\InitScript.js';
    StyleSheets = 'HelloWorld\src\controladdin\HelloWorldAddIn\css\StyleSheets.css';
    Scripts = 'HelloWorld\src\controladdin\HelloWorldAddIn\js\Scripts.js';

    event CallBack();
    procedure HelloWorld(text: Text);
}