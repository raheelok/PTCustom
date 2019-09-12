table 50101 "Sales Line Ship Details"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(50000; "Document Type"; Option)
        {
            OptionMembers = Quote,Order,Invoice,"Credit Memo","Blanket Order","Return Order";
            NotBlank = true;
        }
        field(50001; "Document No."; Code[20])
        {
            NotBlank = true;
        }
        field(50002; "Line No."; Integer)
        {
        }
        field(50003; "Detail Line No."; Integer)
        {

        }
        field(50004; "Type"; Option)
        {
            OptionMembers = "Direct","In WH","Out WH";
        }
        field(50005; "POL"; text[50])
        {

        }
        field(50006; "ETD POL"; Date)
        {

        }
        field(50007; "POD"; text[50])
        {

        }
        field(50008; "ETA POD"; Date)
        {

        }
        field(50009; "Final POD"; text[50])
        {

        }
        field(50010; "Vessel"; text[50])
        {

        }
        field(50011; "BOL Date"; Date)
        {

        }
        field(50012; "Confirmed Arrival Date"; Date)
        {

        }
        field(50013; "Transit Time"; Integer)
        {

        }
        field(50014; "Place"; text[50])
        {

        }
        field(50015; "Shipment Status"; Option)
        {
            OptionMembers = " ","Booked","Cancelled","Hold","Not Sent","Sailed";
        }
        field(50016; "LC No."; Code[30])
        {

        }
        field(50017; "Qty. to Ship"; Decimal)
        {

        }
    }

    keys
    {
        key(PK; "Document Type", "Document No.", "Line No.", "Detail Line No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        l_SalesLineShipDetails: Record "Sales Line Ship Details";
    begin
        l_SalesLineShipDetails.Reset();
        l_SalesLineShipDetails.SetRange("Document Type", Rec."Document Type");
        l_SalesLineShipDetails.SetRange("Document No.", Rec."Document No.");
        l_SalesLineShipDetails.SetRange("Line No.", Rec."Line No.");
        if l_SalesLineShipDetails.FindLast() then
            "Detail Line No." := l_SalesLineShipDetails."Detail Line No." + 10000
        else
            "Detail Line No." := 10000;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}