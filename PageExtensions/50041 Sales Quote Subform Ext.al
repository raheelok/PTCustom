pageextension 50041 "Sales Quote Subform Ext" extends "Sales Quote Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Type1"; "Type1")
            {
                Caption = 'Type';
                ApplicationArea = all;
                //Editable = "ExpirationDateEditable";
            }
            field("Crop Year"; "Crop Year")
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