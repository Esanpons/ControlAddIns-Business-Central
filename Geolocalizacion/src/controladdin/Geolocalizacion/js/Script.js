function init() {
    var controlAddIn = $("#controlAddIn");
    controlAddIn.empty();

    $.get(
        Microsoft.Dynamics.NAV.GetImageResource("Geolocalizacion/src/controlAddIn/Geolocalizacion/html/index.html"),
        function (htmlExterno) {
            controlAddIn.html(htmlExterno);
            console.log(htmlExterno);
            obtenerUbicacion();
        }
    );
}

function obtenerUbicacion() {
    const ubicacionDiv = document.getElementById("ubicacion");

    navigator.geolocation.getCurrentPosition(
        (position) => {
            const { latitude, longitude } = position.coords;
            ubicacionDiv.innerHTML = `Tu ubicación es: Latitud ${latitude}, Longitud ${longitude}`;
        },
        (error) => {
            console.error(error);
            alert("Hubo un error al obtener la ubicación.");
        },
        {
            enableHighAccuracy: true,
            maximumAge: 0,
            timeout: 5000,
        }
    );
}

const boton = document.getElementById("boton-ubicacion");
boton.addEventListener("click", obtenerUbicacion);
