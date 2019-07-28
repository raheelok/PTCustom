pageextension 50035 "Sales Order Archive Ext" extends "Sales Order Archive"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Ver&sion")
        {
            group(PTC)
            {
                action(Invoices)
                {
                    ApplicationArea = All;
                    RunObject = page "Posted Sales Invoices";
                    RunPageLink = "Order No." = field ("No.");
                }
                action(Shipments)
                {
                    ApplicationArea = All;
                    RunObject = page "Posted Sales Shipments";
                    RunPageLink = "Order No." = field ("No.");
                }
            }
        }
    }

    var
        myInt: Integer;
}