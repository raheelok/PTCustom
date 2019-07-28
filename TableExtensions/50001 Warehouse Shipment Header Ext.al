tableextension 50001 "Warehouse Shipment Header Ext" extends "Warehouse Shipment Header"
{
    fields
    {
        field(50000; "Type"; Option)
        {
            OptionMembers = "Direct","In WH","Out WH";
        }
        field(50001; "POL"; text[50])
        {

        }
        field(50002; "ETD POL"; Date)
        {

        }
        field(50003; "POD"; text[50])
        {

        }
        field(50004; "ETA POD"; Date)
        {

        }
        field(50005; "Final POD"; text[50])
        {

        }
        field(50006; "Vessel"; text[50])
        {

        }
        field(50007; "BOL Date"; Date)
        {

        }
        field(50008; "Confirmed Arrival Date"; Date)
        {

        }
        field(50009; "Transit Time"; Integer)
        {

        }
        field(50010; "Place"; text[50])
        {

        }
        field(50011; "Shipment Status"; Option)
        {
            OptionMembers = " ","Booked","Cancelled","Hold","Not Sent","Sailed";
        }
        field(50012; "LC No."; Code[30])
        {

        }
    }

    var
        myInt: Integer;
}