page 60004 "Calendar"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            usercontrol(Calendar; Calendar)
            {
                ApplicationArea = All;
                trigger ControlAddInReady()
                begin
                    CurrPage.Calendar.InitCalendar();
                end;
            }
        }
    }

}