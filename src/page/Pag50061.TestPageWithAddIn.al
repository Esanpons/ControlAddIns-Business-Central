page 50061 "TestPageWithAddIn"
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
            // The control add-in can be placed on the page using usercontrol keyword.
            usercontrol(HelloWorldAddIn; HelloWorldAddIn)
            {

                ApplicationArea = All;

                // The control add-in events can be handled by defining a trigger with a corresponding name.
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