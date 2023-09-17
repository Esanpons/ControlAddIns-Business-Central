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
}
