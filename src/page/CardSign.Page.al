page 60003 "Card Sign"
{
    PageType = Card;
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Card To Sign', Comment = 'ESP="Ficha para firmar"';
    SourceTable = Item;

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
                    Base64ToSign(Base64Sign);
                    Message(Base64Sign);
                end;
            }
        }
    }

    procedure Base64ToSign(Base64Text: Text)
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        DocOutStream: OutStream;
        DocInStream: InStream;
    begin
        Clear(TempBlob);
        Clear(Base64Convert);
        Clear(DocOutStream);
        Clear(DocInStream);

        TempBlob.CreateOutStream(DocOutStream);
        Base64Convert.FromBase64(Base64Text, DocOutStream);
        TempBlob.CreateInStream(DocInStream);

        Rec.FindFirst();
        Clear(Rec."picture");
        Rec."picture".ImportStream(DocInStream, 'sign', 'image/jpeg');
        Rec.Modify();
    end;


}