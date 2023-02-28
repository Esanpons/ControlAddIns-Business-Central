pageextension 60000 "Item Card Ext" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            usercontrol(EditCtl; "EnrichedText")
            {
                ApplicationArea = All;
                trigger OnAfterInit()
                begin
                    EditorReadv := true;
                    if Rec."Item Description" <> '' then
                        CurrPage.EditCtl.Load(Rec."Item Description");
                end;

                trigger ContentChanged()
                begin
                    CurrPage.EditCtl.RequestSave();
                end;

                trigger SaveRequested(data: Text)
                begin
                    Rec."Item Description" := CopyStr(data, 1, 2048);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if EditorReadv then begin
            EditorReadv := false;
            CurrPage.EditCtl.Init();
        end;
    end;

    var
        EditorReadv: Boolean;
}