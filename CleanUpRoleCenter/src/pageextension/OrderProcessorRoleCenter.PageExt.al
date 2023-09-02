pageextension 60001 "Order Processor Role Center" extends "Order Processor Role Center"
{
    layout
    {
        addfirst(rolecenter)
        {
            part("CleanUpRoleCenterPart"; "Clean Up Role Center Part")
            {
                ApplicationArea = All;
            }
        }
    }
}