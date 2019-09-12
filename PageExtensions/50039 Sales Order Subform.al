pageextension 50039 "Sales Order Subform Ext" extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addbefore("Reservation Entries")
        {
            action("Line Shipments Details")
            {
                ApplicationArea = All;
                RunObject = page "Sales Line Ship Details";
                RunPageLink = "Document Type" = field ("Document Type"), "Document No." = field ("Document No."), "Line No." = field ("Line No.");
            }
        }
    }

    var
        myInt: Integer;
}