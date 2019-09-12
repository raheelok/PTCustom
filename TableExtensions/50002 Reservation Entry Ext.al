tableextension 50002 "Reservation Entry Ext" extends "Reservation Entry"
{
    fields
    {
        field(50000; "Crop Year"; Integer)
        {
        }
        field(50001; "Type"; Option)
        {
            OptionMembers = " ",ACB,DAC,DFC,FCV,SAC,KASTHURI,KENTUCKY,"KURNOOL RUSTICA",ORIENTAL,TALMARI,OTHER;
        }
        field(50002; "Form"; Option)
        {
            OptionMembers = " ",BUNDLES,"BUTTED LOOSE LEAF","BUTTED STRAIGHT LAID LOOSE LEAF","BUTTED TANGLED LOOSE LEAF","EXPANDED STEMS",FINES,"HAND STRIPS","LONG STEMS","LOOSE LEAF","MIXED STEMS","RECONSTITUTED SHEET","REDRIED LOOSE LEAF","REDRIED THRESH",SCRAPS,"SHORT STEMS","SOFT DRIED LOOSE LEAF","STRAIGHT LAID LOOSE LEAF",STRIPS,"TANGLED LOOSE LEAF",OTHER;
        }
        field(50003; "Sub Type"; Option)
        {
            OptionMembers = " ","ACB - HDBRG","ACB - Yeleswaram","DAC - Havana","FCV - Lombok","FCV - Mysore","FCV - NLS","FCV - Traditional","ORIENTAL - Basma","ORIENTAL - Basma Komotini","ORIENTAL - Basma Xanthi","ORIENTAL - Dubek","ORIENTAL - Izmir","ORIENTAL - Kabakoulak","ORIENTAL - Katerini","ORIENTAL - Krumovgrad","ORIENTAL - Nevrokop","ORIENTAL - North Bulgaria","ORIENTAL - Saadi","ORIENTAL - Samsun";
        }
        field(50004; "Nicotine %"; Integer)
        {
            MinValue = 0;
            MaxValue = 100;
        }
        field(50005; "Sugar %"; Integer)
        {
            MinValue = 0;
            MaxValue = 100;
        }
        field(50006; "Internal Grade"; Text[50])
        {
        }
        field(50007; "Shipping Grade"; Text[50])
        {
        }
        field(50008; "Customer Grade"; Text[50])
        {
        }
        field(50009; "Packing Material"; Option)
        {
            OptionMembers = " ","C48 Kraft Paper T&B","C48 Polyliner",Cartons,"Hessian Bales",Other;
        }
        field(50010; "Kraft/Poly"; Option)
        {
            OptionMembers = " ",Kraft,Poly,Other;
        }
        field(50011; "Origin"; Option)
        {
            OptionMembers = " ",Zim;
        }
    }

    var
        myInt: Integer;
}