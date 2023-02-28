controladdin "Change Size Selector"
{

    StartupScript =
        'src/controladdin/ChangeSizeSelector/js/Startup.js';

    Scripts = 'src/controladdin/ChangeSizeSelector/js/Scripts.js';

    RequestedHeight = 1;
    RequestedWidth = 1;
    HorizontalShrink = true;
    HorizontalStretch = true;
    event ControlAddInReady();
    procedure Ejecute(Selector: Text; SubtractHeight: Decimal; SubtractWitdh: Decimal; IsAll: Boolean; IsHeight: Boolean; IsWidth: Boolean);
}
