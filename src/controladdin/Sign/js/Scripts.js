
var signPad;
var controlAddIn;
var Html;

function Init(){

    var getHtml = $.get(Microsoft.Dynamics.NAV.GetImageResource("src/controlAddIn/Sign/html/HtmlSign.html"), function (htmlExterno) {
        Html = htmlExterno;
        console.log(Html);
    });

    getHtml.done(function () {
        controlAddIn = $("#controlAddIn");
        controlAddIn.empty();
        controlAddIn.html(Html);

        initSignaturePad();
    });
}
function guardarFirma() {
  if (signPad.isEmpty()) {
    alert('Por favor, firma antes de guardar.');
  } else {
        var imageData = signPad.toDataURL().split(',')[1]; // Obtener solo los datos de la imagen sin el encabezado
        var signatureBase64 = btoa(imageData); // Decodificar los datos en base64

        console.log('Signatura en Base 64',signatureBase64);
        
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("SaveSign", [signatureBase64], true);

        initSignaturePad();
    }
}

function initSignaturePad(){
    var canvas = document.getElementById('signatureCanvas');
    signPad = new SignaturePad(canvas, {
        backgroundColor: 'rgb(255, 255, 255)' // Establecer el color de fondo del canvas
    });
}