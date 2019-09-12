pageextension 50043 "Purchase Order Subform Ext" extends "Purchase Order Subform"
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
                RunObject = page "Purchases Line Ship Details";
                RunPageLink = "Document Type" = field ("Document Type"), "Document No." = field ("Document No."), "Line No." = field ("Line No.");
            }
        }
    }

    var
        myInt: Integer;
}