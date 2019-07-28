report 50021 "Sales Invoice"
{
    RDLCLayout = 'Layout\SalesInvoiceRDLC.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Tax Invoice';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
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
            column(CommentText; CommentText)
            {

            }
            column(PTDesc; PTDesc)
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
                column(g_SrNo; g_SrNo)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    if "Sales Line".Type = "Sales Line".Type::" " then
                        g_SrNo := 0
                    else begin
                        g_SrNoTemp := g_SrNoTemp + 1;
                        g_SrNo := g_SrNoTemp;
                    end;

                end;

            }
            trigger OnAfterGetRecord()
            begin
                if paymentTerms.Get("Sales Header"."Payment Terms Code") then
                    PTDesc := paymentTerms.Description
                else
                    PTDesc := '';

                "Sales Header".CalcFields("Work Description");
                "Sales Header"."Work Description".CreateInStream(CommentStream, TextEncoding::UTF8);
                CommentStream.ReadText(CommentText);
            end;
        }
    }

    var
        CommentStream: InStream;
        CommentText: Text;
        g_SrNo: Integer;
        g_SrNoTemp: Integer;
        paymentTerms: Record "Payment Terms";
        PTDesc: Text[50];

    trigger OnPreReport()
    begin
        g_SrNoTemp := 0;
    end;
}