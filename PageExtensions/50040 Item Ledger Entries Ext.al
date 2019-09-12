pageextension 50040 "Item Ledger Entries Ext" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Order Type")
        {
            field("Origin"; "Origin")
            {
                ApplicationArea = all;
                //Editable = "ExpirationDateEditable";
            }
            field("Crop Year"; "Crop Year")
            {
                ApplicationArea = all;
            }
            field("Type"; "Type")
            {
                ApplicationArea = all;
            }
            field("Sub Type"; "Sub Type")
            {
                ApplicationArea = all;
            }
            field("Form"; "Form")
            {
                ApplicationArea = all;
            }
            field("Nicotine %"; "Nicotine %")
            {
                ApplicationArea = all;
            }
            field("Sugar %"; "Sugar %")
            {
                ApplicationArea = all;
            }
            field("Internal Grade"; "Internal Grade")
            {
                ApplicationArea = all;
            }
            field("Shipping Grade"; "Shipping Grade")
            {
                ApplicationArea = all;
            }
            field("Customer Grade"; "Customer Grade")
            {
                ApplicationArea = all;
            }
            field("Packing Material"; "Packing Material")
            {
                ApplicationArea = all;
            }
            field("Kraft/Poly"; "Kraft/Poly")
            {
                ApplicationArea = all;
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