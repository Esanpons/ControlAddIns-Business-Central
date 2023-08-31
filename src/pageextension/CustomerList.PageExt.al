pageextension 81700 "Customer List" extends "Customer List"
{
    layout
    {
        addfirst(factboxes)
        {
            part(DragAndDropFactbox; "AttachmentsDragAndDropFactbox")
            {
                ApplicationArea = All;
                SubPageLink = "Table ID" = const(Database::Customer), "No." = field("No.");
            }
        }
    }
}
