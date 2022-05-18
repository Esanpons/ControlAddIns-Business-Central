controladdin Wysiwyg
{
    RequestedHeight = 600;
    MinimumHeight = 600;
    MaximumHeight = 600;
    VerticalStretch = true;
    HorizontalStretch = true;
    Scripts = 'src/controladdin/HelloWorldAddIn/js/ckeditor.js', 'src/controladdin/HelloWorldAddIn/js/MainScript.js';
    StartupScript = 'src/controladdin/HelloWorldAddIn/js/startupScript.js';
    RecreateScript = 'src/controladdin/HelloWorldAddIn/js/recreateScript.js';
    StyleSheets = 'src/controladdin/HelloWorldAddIn/css/Stylesheets.css';
    RefreshScript = 'src/controladdin/HelloWorldAddIn/js/refreshScript.js';

    event ControlReady();
    event SaveRequested(data: Text);
    event ContentChanged();
    event OnAfterInit();

    procedure Init();
    procedure Load(data: Text);
    procedure RequestSave();
    procedure SetReadOnly(readonly: boolean);
}

page 50100 "Test Wysiwyg"
{
    layout
    {
        area(Content)
        {
            usercontrol(Test; Wysiwyg)
            {
                ApplicationArea = All;
                trigger ControlReady()
                begin
                    CurrPage.Test.Init();
                    CurrPage.Test.Load('This is a <strong>BOLD</strong> statement!');
                end;

                trigger SaveRequested(data: Text)
                begin
                    Message(data);
                end;
            }
        }
    }
    actions
    {
        area(Creation)
        {
            action(Save)
            {
                trigger OnAction()
                begin
                    CurrPage.Test.RequestSave();
                end;

            }
        }
    }
}