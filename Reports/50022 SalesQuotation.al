report 50022 "Sales Quotation"
{
    RDLCLayout = 'Layout\SalesQuotationRDLC.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'LU Quotation';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "Document Type", "No.";
            column("Document_Type"; "Document Type")
            {

            }
            column("No_"; "No.")
            {

            }
            column("Sell_to_Customer_No_"; "Sell-to Customer No.")
            {

            }
            column("Sell_to_Customer_Name"; "Sell-to Customer Name")
            {

            }
            column("Sell_to_Customer_Name_2"; "Sell-to Customer Name 2")
            {

            }
            column("Sell_to_Address"; "Sell-to Address")
            {

            }
            column("Sell_to_Address_2"; "Sell-to Address 2")
            {

            }
            column("Sell_to_City"; "Sell-to City")
            {

            }
            column("Sell_to_County"; "Sell-to County")
            {

            }
            column("VAT_Registration_No_"; "VAT Registration No.")
            {

            }
            column("Document_Date"; "Document Date")
            {

            }
            column("External_Document_No_"; "External Document No.")
            {

            }
            column("Amount"; Amount)
            {

            }
            column("Amount_Including_VAT"; "Amount Including VAT")
            {

            }
            column("Work_Description"; "Work Description")
            {

            }
            dataitem("Sales Line"; "Sales Line")
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
                column("SalesLine_Unit_Price"; "Unit Price")
                {

                }
                column("SalesLine_Line_Amount"; "Line Amount")
                {

                }

            }
        }
    }

    trigger OnPreReport();
    begin
        "Sales Header".CalcFields("Work Description");
    end;

    var
        myInt: Integer;
}