page 60061 "TestPageAddIn"
{
    Caption = 'Test Page AddIn';

    PageType = List;
    Editable = false;
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(Content)
        {
            usercontrol(HelloWorldAddIn; HelloWorldAddIn)
            {
                ApplicationArea = All;

                trigger Callback()
                begin
                    CurrPage.HelloWorldAddIn.HelloWorld('El Inicio');
                end;
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(LlamarFuncion)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    CurrPage.HelloWorldAddIn.HelloWorld('Action');
                end;
            }
        }
    }
}