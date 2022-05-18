page 50077 ABDMensaje
{
    Caption = 'ABD Mensaje Comercial';
    PageType = Card;
    SaveValues = true;
    layout
    {
        area(content)
        {
            group("Indicar Mensaje")
            {
                usercontrol(EditCtl; Wysiwyg)
                {
                    ApplicationArea = all;
                    trigger ControlReady()
                    begin
                        Currpage.EditCtl.Init;
                    end;

                    trigger OnAfterInit()
                    begin
                        CurrPage.EditCtl.Load(mensaje);
                    end;

                    trigger ContentChanged()
                    begin
                        CurrPage.EditCtl.RequestSave();
                    end;

                    trigger SaveRequested(data: Text)
                    begin
                        mensaje := data;
                    end;
                }
            }
        }
    }
    var
        mensaje: text[2048];

    procedure GetDatos(): Text
    begin
        exit(mensaje);
    end;
}