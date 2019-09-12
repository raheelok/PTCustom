tableextension 50011 "Sales Line Ext" extends "Sales Line"
{
    fields
    {
        field(50000; "Crop Year"; Integer)
        {
        }
        field(50001; "Type1"; Option)
        {
            OptionMembers = " ",ACB,DAC,DFC,FCV,SAC,KASTHURI,KENTUCKY,"KURNOOL RUSTICA",ORIENTAL,TALMARI,OTHER;
        }

    }

    var
        myInt: Integer;
}