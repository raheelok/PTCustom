tableextension 50000 "Tracking Specification Ext" extends "Tracking Specification"
{
    fields
    {
        modify("Lot No.")
        {
            trigger OnAfterValidate()
            begin
                InitCustomFields;
            end;
        }
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

    procedure InitCustomFields()
    var
        EntriesExist: Boolean;
    begin
        if ("Serial No." = xRec."Serial No.") and ("Lot No." = xRec."Lot No.") then
            exit;

        clear("Crop Year");
        "Type" := ' ';
        Form := ' ';
        "Sub Type" := ' ';
        clear("Nicotine %");
        clear("Sugar %");
        clear("Internal Grade");
        clear("Shipping Grade");
        clear("Customer Grade");
        "Packing Material" := ' ';
        "Kraft/Poly" := ' ';
        Origin := ' ';

        EntriesExist := false;
        g_CropYear := g_PTCustomCU.ExistingCropYear("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            "Crop Year" := g_CropYear;

        EntriesExist := false;
        g_Type := g_PTCustomCU.ExistingType("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            "Type" := g_Type;

        EntriesExist := false;
        g_Form := g_PTCustomCU.ExistingForm("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            "Form" := g_Form;

        EntriesExist := false;
        g_Sub_Type := g_PTCustomCU.ExistingSub_Type("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            "Sub Type" := g_Sub_Type;

        EntriesExist := false;
        "g_Nicotine_%" := g_PTCustomCU.ExistingNicotine("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            "Nicotine %" := "g_Nicotine_%";

        EntriesExist := false;
        "g_Sugar_%" := g_PTCustomCU.ExistingSugar("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            "Sugar %" := "g_Sugar_%";

        EntriesExist := false;
        g_Internal_Grade := g_PTCustomCU.ExistingInternalGrade("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            "Internal Grade" := g_Internal_Grade;

        EntriesExist := false;
        g_Shipping_Grade := g_PTCustomCU.ExistingShippingGrade("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            "Shipping Grade" := g_Shipping_Grade;

        EntriesExist := false;
        g_Customer_Grade := g_PTCustomCU.ExistingCustomerGrade("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            "Customer Grade" := g_Customer_Grade;

        EntriesExist := false;
        g_Packing_Material := g_PTCustomCU.ExistingPackingMaterial("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            "Packing Material" := g_Packing_Material;

        EntriesExist := false;
        "g_Kraft/Poly" := g_PTCustomCU.ExistingKraftPoly("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            "Kraft/Poly" := "g_Kraft/Poly";

        EntriesExist := false;
        g_Origin := g_PTCustomCU.ExistingOrigin("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            Origin := g_Origin;

        // "Expiration Date" := 0D;

        // ExpDate := ItemTrackingMgt.ExistingExpirationDate("Item No.", "Variant Code", "Lot No.", "Serial No.", FALSE, EntriesExist);
        // IF EntriesExist THEN BEGIN
        //     "Expiration Date" := ExpDate;
        //     "Buffer Status2" := "Buffer Status2"::"ExpDate blocked";
        // END ELSE
        //     "Buffer Status2" := 0;

        // IF IsReclass THEN BEGIN
        //     "New Expiration Date" := "Expiration Date";
        //     "Warranty Date" := ItemTrackingMgt.ExistingWarrantyDate("Item No.", "Variant Code", "Lot No.", "Serial No.", EntriesExist);
        // END;
    end;

    var
        g_PTCustomCU: Codeunit "PTCustom CU";
        g_CropYear: Integer;
        g_Type: Option " ",ACB,DAC,DFC,FCV,SAC,KASTHURI,KENTUCKY,"KURNOOL RUSTICA",ORIENTAL,TALMARI,OTHER;
        g_Form: Option " ",BUNDLES,"BUTTED LOOSE LEAF","BUTTED STRAIGHT LAID LOOSE LEAF","BUTTED TANGLED LOOSE LEAF","EXPANDED STEMS",FINES,"HAND STRIPS","LONG STEMS","LOOSE LEAF","MIXED STEMS","RECONSTITUTED SHEET","REDRIED LOOSE LEAF","REDRIED THRESH",SCRAPS,"SHORT STEMS","SOFT DRIED LOOSE LEAF","STRAIGHT LAID LOOSE LEAF",STRIPS,"TANGLED LOOSE LEAF",OTHER;
        g_Sub_Type: Option " ","ACB - HDBRG","ACB - Yeleswaram","DAC - Havana","FCV - Lombok","FCV - Mysore","FCV - NLS","FCV - Traditional","ORIENTAL - Basma","ORIENTAL - Basma Komotini","ORIENTAL - Basma Xanthi","ORIENTAL - Dubek","ORIENTAL - Izmir","ORIENTAL - Kabakoulak","ORIENTAL - Katerini","ORIENTAL - Krumovgrad","ORIENTAL - Nevrokop","ORIENTAL - North Bulgaria","ORIENTAL - Saadi","ORIENTAL - Samsun";
        "g_Nicotine_%": Integer;
        "g_Sugar_%": Integer;
        g_Internal_Grade: Text[50];
        g_Shipping_Grade: Text[50];
        g_Customer_Grade: Text[50];
        g_Packing_Material: Option " ","C48 Kraft Paper T&B","C48 Polyliner",Cartons,"Hessian Bales",Other;
        "g_Kraft/Poly": Option " ",Kraft,Poly,Other;
        g_Origin: Option " ",Zim;
}