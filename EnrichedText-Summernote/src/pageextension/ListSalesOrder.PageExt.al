pageextension 50001 "List Sales Order" extends "Sales Order List"
{
    layout
    {
        addafter(Control1)
        {
            group(ControlAddins2)
            {
                Caption = 'Descriptions';
                usercontrol(SummernoteComments; "SummerNote")
                {
                    ApplicationArea = All;
                    trigger ControlAddInReady()
                    begin
                        CreateDescriptions();
                    end;

                    trigger OnChangeComments(Data: Text; EntryNo: Integer; OrderNo: Code[20])
                    var
                        SalesHeader: Record "Sales Header";
                    begin
                        SalesHeader.get(SalesHeader."Document Type"::Order, OrderNo);
                        SalesHeader.SetWorkDescription(Data);
                    end;

                    trigger MentionComments(UserMention: JsonObject; EntryNo: Integer)
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
        CreateDescriptions();
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

    local procedure CreateDescriptions()
    var
        SalesHeader: Record "Sales Header";
        i: Integer;
    begin
        i := 0;

        CurrPage.SummernoteComments.InitHtmlComments(CreateJson());

        SalesHeader.Reset();
        SalesHeader.CopyFilters(Rec);
        SalesHeader.FindSet();
        repeat
            NewData := SalesHeader.GetWorkDescription();
            if NewData <> '' then begin
                i += 1;
                CurrPage.SummernoteComments.AddNewSummerNoteComments(NewData, i, SalesHeader."No.");
            end;

        until SalesHeader.Next() = 0;

        CurrPage.SummernoteComments.FinishHtmlComments();
    end;

    var
        NewData: Text;
}