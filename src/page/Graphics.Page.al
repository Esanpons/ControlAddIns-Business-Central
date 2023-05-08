page 60000 "Graphics"
{
    PageType = Card;
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Graphics', comment = 'ESP="graficos"';

    layout
    {
        area(Content)
        {

            usercontrol(Graphics; "Graphics")
            {
                ApplicationArea = All;
                trigger ControlAddInReady()
                var
                    JArrayEtiquetas: JsonArray;
                    JArrayData: JsonArray;
                    TitulosLbl: Label 'Sales', Comment = 'ESP="Ventas"';
                begin
                    JArrayData.Add(1500);
                    JArrayData.Add(200);
                    JArrayData.Add(8250);
                    JArrayData.Add(5001);

                    JArrayEtiquetas.Add('Enero');
                    JArrayEtiquetas.Add('Febreo');
                    JArrayEtiquetas.Add('Marzo');
                    JArrayEtiquetas.Add('Abril');

                    CurrPage.Graphics.Init(JArrayEtiquetas, JArrayData, TitulosLbl);
                end;
            }
        }
    }
}