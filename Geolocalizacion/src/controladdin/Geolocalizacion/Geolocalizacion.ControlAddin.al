controladdin "Geolocalizacion"
{
    RequestedHeight = 250;
    RequestedWidth = 500;
    StartupScript = 'Geolocalizacion/src/controlAddIn/Geolocalizacion/js/StartUp.js';
    Scripts =
        'Geolocalizacion/src/controlAddIn/Geolocalizacion/js/Script.js',
        'https://code.jquery.com/jquery-3.6.0.min.js';

    Images = 'Geolocalizacion/src/controlAddIn/Geolocalizacion/html/index.html';

    event ControlAddInReady();

    procedure init();
}