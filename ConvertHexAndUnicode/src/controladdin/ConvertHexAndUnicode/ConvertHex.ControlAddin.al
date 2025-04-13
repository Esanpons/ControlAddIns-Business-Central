controladdin "ConvertHexAndUnicode"
{
    RequestedHeight = 1;
    RequestedWidth = 1;
    Scripts = 'ConvertHexAndUnicode\src\controladdin\ConvertHexAndUnicode\js\script.js';

    event MyEvent()

    procedure hexToUnicode(hex: Text);
    procedure unicodeToHex(unicode: Text);

    event OnHexToUnicode(Result: Text);
    event OnUnicodeToHex(Result: Text);

}