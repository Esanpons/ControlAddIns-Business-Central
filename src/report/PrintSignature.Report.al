report 60000 "Print Signature"
{
    DefaultLayout = RDLC;
    ApplicationArea = All;
    Caption = 'Print Signature', Comment = 'ESP="Imprimir firma"';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'src\report\PrintSign.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Picture; Picture)
            {
            }

        }
    }
}
