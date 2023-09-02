controladdin "Calendar"
{
    MinimumHeight = 500;
    MinimumWidth = 250;
    HorizontalShrink = true;
    HorizontalStretch = true;
    VerticalShrink = true;
    VerticalStretch = true;

    StartupScript = 'Calendar\src\controladdin\Calendar\js\startup.js';

    StyleSheets = 'Calendar\src\controladdin\Calendar\css\StyleSheets.css',
                    'https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css';

    Scripts = 'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js',
                'https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js',
                'https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js',
                'https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/locale/es.js',
                'Calendar\src\controladdin\Calendar\js\Scripts.js';

    Images = 'Calendar\src\controladdin\Calendar\html\main.html';

    event ControlAddInReady();
    procedure InitCalendar();

}