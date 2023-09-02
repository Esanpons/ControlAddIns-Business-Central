var Html;
var controlAddIn;

function CargarVideo() {
    $("#controlAddIn").load(
        Microsoft.Dynamics.NAV.GetImageResource("ViewVideo/src/controlAddIn/ViewVideo/html/HtmlHeader.html"),
        function (htmlExterno) {
            Html = htmlExterno;

            var video = $("#video-local");
            video.attr(
                "src",
                Microsoft.Dynamics.NAV.GetImageResource("ViewVideo/src/controlAddIn/ViewVideo/video/VideoEjemplo.mp4")
            );
        }
    );
    /*
    $.get(
        Microsoft.Dynamics.NAV.GetImageResource("ViewVideo/src/controlAddIn/video/html/HtmlHeader.html"),
        function (Externo1) {
            Html = Externo1;
            controlAddIn = $("#controlAddIn");

            controlAddIn.empty();
            controlAddIn.html(Html);
            
            var video = $("#video-local");
            video.attr(
                "src",
                Microsoft.Dynamics.NAV.GetImageResource("ViewVideo/src/controlAddIn/ViewVideo/video/VideoEjemplo.mp4")
            );

            
        }
    );
    */
}
