page 60002 "Geolocalizacion"
{
    PageType = Card;
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Geolocation', comment = 'ESP="Geolocalizacion"';

    layout
    {
        area(Content)
        {

            usercontrol(Geolocalizacion; "Geolocalizacion")
            {
                ApplicationArea = All;
                trigger ControlAddInReady()
                begin
                    CurrPage.Geolocalizacion.Init();
                end;
            }
        }
    }
}