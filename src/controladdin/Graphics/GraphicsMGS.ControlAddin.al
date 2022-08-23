controladdin "Graphics MGS"
{
    RequestedHeight = 250;
    RequestedWidth = 500;
    StartupScript = 'src/controlAddIn/Graphics/js/StarUp.js';
    Scripts =
        'src/controlAddIn/Graphics/js/Script.js',
        'https://cdn.jsdelivr.net/npm/chart.js@latest/dist/Chart.min.js',
        'https://code.jquery.com/jquery-3.6.0.min.js';
    Images = 'src/controlAddIn/Graphics/html/Init.html';

    event ControlAddInReady();
    procedure Init(etiquetas: JsonArray; data: JsonArray; TituloData: Text);

}