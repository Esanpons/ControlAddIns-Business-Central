var datos;

function Init(etiquetas, data, TituloData) {
    var controlAddIn = $("#controlAddIn");
    controlAddIn.empty();

    datos = {
        label: TituloData,
        data: data,
        backgroundColor: 'rgba(54, 162, 235, 0.2)', // Color de fondo
        borderColor: 'rgba(54, 162, 235, 1)', // Color del borde
        borderWidth: 1,// Ancho del borde
    };


    $.get(Microsoft.Dynamics.NAV.GetImageResource("src/controlAddIn/Graphics/html/Init.html"), function (htmlExterno) {
        controlAddIn.html(htmlExterno);
        console.log(htmlExterno);
        CrearGrafica(etiquetas);
    });
}

function CrearGrafica(etiquetas) {
    // Obtener una referencia al elemento canvas del DOM
    const $grafica = document.querySelector("#grafica");

    new Chart($grafica, {
        type: 'bar',// Tipo de gráfica
        data: {
            labels: etiquetas,
            datasets: [
                datos
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }],
            },
        }
    });
}


/*

*/