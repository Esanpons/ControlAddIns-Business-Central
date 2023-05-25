page 60003 "Card Sign"
{
    PageType = Card;
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Card To Sign', Comment = 'ESP="Ficha para firmar"';

    layout
    {
        area(Content)
        {
            usercontrol(Sign; "Sign")
            {
                ApplicationArea = All;

                trigger ControlAddInReady()
                begin
                    CurrPage.Sign.Init();
                end;

                trigger SaveSign(Base64Sign: Text)
                begin
                    Message(Base64Sign);
                end;
            }
        }
    }


}