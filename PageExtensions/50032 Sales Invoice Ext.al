pageextension 50032 "Sales Invoice Ext" extends "Sales Invoice"
{
    layout
    {

    }

    actions
    {
        addlast("P&osting")
        {
            action("PT Tax Invoice")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    g_SalesHeader.Reset();
                    g_SalesHeader.SetRange("Document Type", "Document Type");
                    g_SalesHeader.SetRange("No.", "No.");
                    Report.Run(50021, true, false, g_SalesHeader);
                end;
            }
        }
    }

    var
        g_SalesHeader: Record "Sales Header";
}