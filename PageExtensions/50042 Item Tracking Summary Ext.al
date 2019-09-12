pageextension 50042 "Item Tracking Summary Ext" extends "Item Tracking Summary"
{
    layout
    {
        addafter("Total Quantity")
        {
            field("Origin"; "Origin")
            {
                ApplicationArea = all;
                //Editable = "ExpirationDateEditable";
                Visible = false;
            }
            field("Crop Year"; "Crop Year")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Type"; "Type")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Sub Type"; "Sub Type")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Form"; "Form")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Nicotine %"; "Nicotine %")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Sugar %"; "Sugar %")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Internal Grade"; "Internal Grade")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Shipping Grade"; "Shipping Grade")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Customer Grade"; "Customer Grade")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Packing Material"; "Packing Material")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Kraft/Poly"; "Kraft/Poly")
            {
                ApplicationArea = all;
                Visible = false;
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