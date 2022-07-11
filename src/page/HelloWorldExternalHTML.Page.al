page 65000 "HelloWorldExternalHTML"
{
    Caption = 'HelloWorldExternalHTML';

    PageType = List;
    Editable = false;
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(Content)
        {
            usercontrol(HelloWorldExternalHTML; HelloWorldExternalHTML)
            {
                ApplicationArea = All;

                trigger Callback()
                begin
                    CurrPage.HelloWorldExternalHTML.HelloWorld('El Inicio');
                end;
            }
        }
    }
}