pageextension 50000 "Card Sales Order" extends "Sales Order"
{
    layout
    {
        addafter(General)
        {
            group(ControlAddins1)
            {
                Caption = 'Description';
                usercontrol(SummernoteDescription; "SummerNote")
                {

                    ApplicationArea = All;

                    trigger ControlAddInReady()
                    begin
                        NewData := Rec.GetWorkDescription();
                        CurrPage.SummernoteDescription.AddNewSummerNoteDescription(NewData, CreateJson());
                    end;

                    trigger OnChangeDescription(Data: Text)
                    begin
                        NewData := Data;
                        Rec.SetWorkDescription(NewData);
                    end;

                    trigger MentionDescription(UserMention: JsonObject)
                    var
                        JToken: JsonToken;
                        JValue: JsonValue;
                    begin
                        UserMention.Get('code', JToken);
                        JValue := JToken.AsValue();
                        Message(JValue.AsText());
                    end;
                }
            }

        }
    }

    trigger OnAfterGetRecord()
    begin

        NewData := '';
        NewData := Rec.GetWorkDescription();

        CurrPage.SummernoteDescription.SetDataDescription(NewData);
        if CurrPage.Editable then
            CurrPage.SummernoteDescription.EnableDescription()
        else
            CurrPage.SummernoteDescription.DisableDescription();

    end;

    procedure CreateJson() ReturnArrayJson: JsonArray
    var
        JObject: JsonObject;
    begin
        Clear(JObject);
        JObject.Add('name', 'Esteve Sanpons');
        JObject.Add('code', 'esanpons');

        ReturnArrayJson.Add(JObject);

        Clear(JObject);
        JObject.Add('name', 'Roberto Rodriguez');
        JObject.Add('code', 'rrodriguez');

        ReturnArrayJson.Add(JObject);

        Clear(JObject);
        JObject.Add('name', 'Fernando Martin');
        JObject.Add('code', 'fmartin');

        ReturnArrayJson.Add(JObject);
    end;

    var
        NewData: Text;
}
