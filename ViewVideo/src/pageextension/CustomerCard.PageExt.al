
pageextension 50100 CustomerCard extends "Customer Card"
{
    layout
    {
        addfirst(General)
        {
            usercontrol(ViewVideo; ViewVideo)
            {
                ApplicationArea = All;

                trigger ControlAddInReady()
                begin
                    CurrPage.ViewVideo.CargarVideo();
                end;
            }
        }
    }
}