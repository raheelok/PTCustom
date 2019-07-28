pageextension 50033 "Sales Quote Ext" extends "Sales Quote"
{
    actions
    {
        addlast("&Quote")
        {
            action("PT Quote")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    g_SalesHeader.Reset();
                    g_SalesHeader.SetRange("Document Type", "Document Type");
                    g_SalesHeader.SetRange("No.", "No.");
                    Report.Run(50022, true, false, g_SalesHeader);
                end;
            }
        }
    }

    var
        g_SalesHeader: Record "Sales Header";
}