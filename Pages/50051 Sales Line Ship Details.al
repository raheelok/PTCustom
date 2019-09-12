page 50051 "Sales Line Ship Details"
{
    PageType = List;
    SourceTable = "Sales Line Ship Details";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                }
                field("Detail Line No."; "Detail Line No.")
                {
                    ApplicationArea = All;
                }
                field("Type"; "Type")
                {
                    ApplicationArea = All;
                    ;
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
                field("Qty. to Ship"; "Qty. to Ship")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Post Shipment")
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    l_SalesPost: Codeunit "Sales-Post";
                    l_SalesHeader: Record "Sales Header";
                begin
                    Rec.FindFirst();
                    l_SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                    l_SalesHeader.Ship := true;
                    l_SalesPost.Run(l_SalesHeader);
                end;
            }
        }
    }
}