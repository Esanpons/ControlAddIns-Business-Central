

var events = [
    {
        title: 'Event 1',
        start: '2023-06-01',
        end: '2023-06-03',
        color1: 'red',
        color2: 'blue',
        textColor: 'white'
    },
    {
        title: 'Event 2',
        start: '2023-06-05',
        end: '2023-06-05',
        color1: 'green',
        color2: 'yellow',
        textColor: 'black'
    }
];

var legendItems = [
    { 
        name: 'Color 2: Event 1', 
        color: 'blue' 
    },
    {
        name: 'Color 2: Event 2', 
        color: 'yellow'
    }
];

var legendItems2 = [
    { 
        name: 'Color 1: Event 1', 
        color: 'red' 
    },
    {
        name: 'Color 1: Event 2', 
        color: 'green'
    }
];

function InitCalendar() {
    var getHtml = $.get(Microsoft.Dynamics.NAV.GetImageResource("src/controladdin/Calendar/html/main.html"), function (htmlExterno) {
        Html = htmlExterno;
        console.log(Html);
    });

    getHtml.done(function () {
        controlAddIn = $("#controlAddIn");
        controlAddIn.empty();
        controlAddIn.html(Html);

        var calendarOptions = {
            height: $(window).height() * 0.93,
            initialView: 'dayGridMonth',
            locale: 'es',
            timeZone: 'Europe/Madrid',
            events: events,
            eventRender: function (event, element) {
                var gradient = 'linear-gradient(to right, ' + event.color1 + ', ' + event.color1 + ' 15px, ' + event.color2 + ' 15px, ' + event.color2 + ')';
                element.css('background', gradient);
    
                var titleElement = element.find('.fc-title');
                titleElement.css('padding-left', '25px');
                titleElement.css('color', event.textColor);
            }
        };
    
        $('#calendar').fullCalendar(calendarOptions);
    
        // Generar la leyenda de colores dinámicamente
        var legendElement = $('#legend1');
        legendItems.forEach(function (item) {
            var legendItem = $('<div>', { class: 'legend-item' });
            var legendColor = $('<div>', { class: 'legend-color' }).css('background-color', item.color);
            var legendLabel = $('<div>', { class: 'legend-label' }).text(item.name);
            legendItem.append(legendColor, legendLabel);
            legendElement.append(legendItem);
        });

        var legendElement2 = $('#legend2');
        legendItems2.forEach(function (item) {
            var legendItem = $('<div>', { class: 'legend-item' });
            var legendColor = $('<div>', { class: 'legend-color' }).css('background-color', item.color);
            var legendLabel = $('<div>', { class: 'legend-label' }).text(item.name);
            legendItem.append(legendColor, legendLabel);
            legendElement2.append(legendItem);
        });
    });
}
