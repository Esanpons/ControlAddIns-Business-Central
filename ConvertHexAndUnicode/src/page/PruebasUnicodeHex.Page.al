page 55000 "Pruebas Unicode - Hex"
{
    ApplicationArea = All;
    Caption = 'Pruebas Unicode - Hex';
    PageType = Card;
    UsageCategory = Administration;
    Editable = false;

    layout
    {
        area(content)
        {


            usercontrol(Convert; "ConvertHexAndUnicode")
            {
                ApplicationArea = All;

                trigger OnHexToUnicode(Result: Text)
                begin
                    Message('Texto convertido desde Hex: %1', Result);
                end;

                trigger OnUnicodeToHex(Result: Text)
                begin
                    Message('Texto convertido a Hex: %1', Result);
                end;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("ConvertirHex")
            {
                Caption = ' Hex ➝ Unicode';
                ApplicationArea = All;
                ToolTip = ' ';
                trigger OnAction()
                begin
                    CurrPage.Convert.hexToUnicode('11629C55226B200041006500730076006100');
                end;
            }

            action("ConvertirTexto")
            {
                Caption = ' Unicode ➝ Hex';
                ApplicationArea = All;
                ToolTip = ' ';
                trigger OnAction()
                begin
                    CurrPage.Convert.unicodeToHex('我喜欢 Aesva'); // Me gusta Aesva
                end;
            }
        }
    }



}