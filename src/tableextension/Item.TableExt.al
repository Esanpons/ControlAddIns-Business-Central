tableextension 60000 "Item" extends Item
{
    fields
    {
        field(60000; "Item Description"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Item Description', Comment = 'ESP="Descripción producto"';
        }
    }
}