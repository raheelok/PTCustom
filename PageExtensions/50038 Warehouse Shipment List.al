pageextension 50038 "Warehouse Shipment List Ext" extends "Warehouse Shipment List"
{
    layout
    {
        addafter("Location Code")
        {
            field(Type; Type)
            {
                ApplicationArea = All;
            }
            field("POL"; "POL")
            {
                ApplicationArea = All;
            }
            field("ETD POL"; "ETD POL")
            {
                ApplicationArea = All;
            }
            field("POD"; "POD")
            {
                ApplicationArea = All;
            }
            field("ETA POD"; "ETA POD")
            {
                ApplicationArea = All;
            }
            field("Final POD"; "Final POD")
            {
                ApplicationArea = All;
            }
            field("Vessel"; "Vessel")
            {
                ApplicationArea = All;
            }
            field("BOL Date"; "BOL Date")
            {
                ApplicationArea = All;
            }
            field("Confirmed Arrival Date"; "Confirmed Arrival Date")
            {
                ApplicationArea = All;
            }
            field("Transit Time"; "Transit Time")
            {
                ApplicationArea = All;
            }
            field("Place"; "Place")
            {
                ApplicationArea = All;
            }
            field("Shipment Status"; "Shipment Status")
            {
                ApplicationArea = All;
            }
            field("LC No."; "LC No.")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}