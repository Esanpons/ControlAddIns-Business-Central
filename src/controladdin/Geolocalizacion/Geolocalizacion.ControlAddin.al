controladdin "Geolocalizacion"
{
    RequestedHeight = 250;
    RequestedWidth = 500;
    StartupScript = 'src/controlAddIn/Geolocalizacion/js/StarUp.js';
    Scripts =
        'src/controlAddIn/Geolocalizacion/js/Script.js',
        'https://code.jquery.com/jquery-3.6.0.min.js';

    Images = 'src/controlAddIn/Geolocalizacion/html/index.html';

    event ControlAddInReady();

    procedure init();
}