page 60001 "ChangeSizeSelector"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            //contenedor de la izquierda
            usercontrol(ChangeHeightSelector01; "Change Size Selector")
            {
                ApplicationArea = All;
                trigger ControlAddInReady()
                var
                    SelectoLbl: Label 'div[class="ms-nav-grid-horizontal-container"]', Locked = true;
                begin
                    CurrPage.ChangeHeightSelector01.Ejecute(SelectoLbl, 450, 0, false, true, false);
                end;
            }

            //contenedor de la derecha
            usercontrol(ChangeHeightSelector02; "Change Size Selector")
            {
                ApplicationArea = All;
                trigger ControlAddInReady()
                var
                    SelectoLbl: Label 'div[class="ms-nav-layout-lastcolumn"]', Locked = true;
                begin
                    CurrPage.ChangeHeightSelector02.Ejecute(SelectoLbl, 450, 0, false, true, false);
                end;
            }

            grid(MyGrid)
            {
                GridLayout = Rows;
                ShowCaption = false;
                repeater(Control1)
                {
                    field(No; Rec."No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the field', comment = 'ESP="Especifica el valor del campo"';
                    }
                    field(Name; Rec.Name)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the field', comment = 'ESP="Especifica el valor del campo"';
                    }
                }

                group(PagesPart)
                {

                    ShowCaption = false;
                    part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
                    {
                        ApplicationArea = All;
                        SubPageLink = "No." = FIELD("No.");
                        UpdatePropagation = Both;
                    }
                }
            }
        }
    }


}