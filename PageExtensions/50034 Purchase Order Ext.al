pageextension 50034 "Purchase Order Ext" extends "Purchase Order"
{
    actions
    {
        addlast(Print)
        {
            action("PT PO")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    g_SalesHeader.Reset();
                    g_SalesHeader.SetRange("Document Type", "Document Type");
                    g_SalesHeader.SetRange("No.", "No.");
                    Report.Run(50023, true, false, g_SalesHeader);
                end;
            }
        }
    }

    var
        g_SalesHeader: Record "Purchase Header";
}