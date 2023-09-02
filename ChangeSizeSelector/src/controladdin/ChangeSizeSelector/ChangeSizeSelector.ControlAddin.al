controladdin "Change Size Selector"
{

    StartupScript =
        'ChangeSizeSelector/src/controladdin/ChangeSizeSelector/js/Startup.js';

    Scripts = 'ChangeSizeSelector/src/controladdin/ChangeSizeSelector/js/Scripts.js';

    RequestedHeight = 1;
    RequestedWidth = 1;
    HorizontalShrink = true;
    HorizontalStretch = true;
    event ControlAddInReady();
    procedure Ejecute(Selector: Text; SubtractHeight: Decimal; SubtractWitdh: Decimal; IsAll: Boolean; IsHeight: Boolean; IsWidth: Boolean);
}
