report 50023 "Purchase Order"
{
    RDLCLayout = 'Layout\PurchaseOrderRDLC.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'LU Purchase Order';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column("Document_Type"; "Document Type")
            {

            }
            column("No_"; "No.")
            {

            }
            column("Sell_to_Customer_No_"; "Buy-from Vendor No.")
            {

            }
            column("Sell_to_Customer_Name"; "Buy-from Vendor Name")
            {

            }
            column("Sell_to_Customer_Name_2"; "Buy-from Vendor Name 2")
            {

            }
            column("Sell_to_Address"; "Buy-from Address")
            {

            }
            column("Sell_to_Address_2"; "Buy-from Address 2")
            {

            }
            column("Sell_to_City"; "Buy-from City")
            {

            }
            column("Sell_to_County"; "Buy-from County")
            {

            }
            column("VAT_Registration_No_"; "VAT Registration No.")
            {

            }
            column("Document_Date"; "Document Date")
            {

            }
            column("Amount"; Amount)
            {

            }
            column("Amount_Including_VAT"; "Amount Including VAT")
            {

            }
            column("Currency_Code"; "Currency Code")
            {

            }
            column(PTDesc; PTDesc)
            {

            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = field ("Document Type"), "Document No." = field ("No.");
                column("SalesLine_Line_No_"; "Line No.")
                {

                }
                column("SalesLine_Type"; "Type")
                {

                }
                column("SalesLine_No_"; "No.")
                {

                }
                column("SalesLine_Description"; "Description")
                {

                }
                column("SalesLine_Quantity"; "Quantity")
                {

                }
                column("SalesLine_Unit_Price"; "Unit Cost")
                {

                }
                column("SalesLine_UnitofMeasureCode"; "Unit of Measure Code")
                {

                }
                column("SalesLine_Line_Amount"; "Line Amount")
                {

                }
                column(g_SrNo; g_SrNo)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    if "Purchase Line".Type = "Purchase Line".Type::" " then
                        g_SrNo := 0
                    else begin
                        g_SrNoTemp := g_SrNoTemp + 1;
                        g_SrNo := g_SrNoTemp;
                    end;

                end;
            }
            trigger OnAfterGetRecord()
            begin
                if paymentTerms.Get("Purchase Header"."Payment Terms Code") then
                    PTDesc := paymentTerms.Description
                else
                    PTDesc := '';
            end;
        }
    }

    var
        g_SrNo: Integer;
        g_SrNoTemp: Integer;
        paymentTerms: Record "Payment Terms";
        PTDesc: Text[50];
}