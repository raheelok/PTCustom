codeunit 50091 "PTCustom CU"
{
    trigger OnRun()
    begin

    end;


    [EventSubscriber(ObjectType::Page, 6510, 'OnAfterCreateReservEntryFor', '', false, false)]
    local procedure OnAfterCreateReservEntryFor(var OldTrackingSpecification: Record "Tracking Specification"; var NewTrackingSpecification: Record "Tracking Specification")
    begin
        Clear(g_CropYear);
        Clear(g_Type);
        Clear(g_Form);
        Clear(g_Sub_Type);
        Clear("g_Nicotine_%");
        Clear("g_Sugar_%");
        Clear(g_Internal_Grade);
        Clear(g_Shipping_Grade);
        Clear(g_Customer_Grade);
        Clear(g_Packing_Material);
        Clear("g_Kraft/Poly");
        Clear(g_Origin);

        g_CropYear := NewTrackingSpecification."Crop Year";
        g_Type := NewTrackingSpecification.Type;
        g_Form := NewTrackingSpecification.Form;
        g_Sub_Type := NewTrackingSpecification."Sub Type";
        "g_Nicotine_%" := NewTrackingSpecification."Nicotine %";
        "g_Sugar_%" := NewTrackingSpecification."Sugar %";
        g_Internal_Grade := NewTrackingSpecification."Internal Grade";
        g_Shipping_Grade := NewTrackingSpecification."Shipping Grade";
        g_Customer_Grade := NewTrackingSpecification."Customer Grade";
        g_Packing_Material := NewTrackingSpecification."Packing Material";
        "g_Kraft/Poly" := NewTrackingSpecification."Kraft/Poly";
        g_Origin := NewTrackingSpecification.Origin;
    end;


    [EventSubscriber(ObjectType::Codeunit, 99000830, 'OnCreateEntryOnBeforeSurplusCondition', '', false, false)]
    local procedure OnCreateEntryOnBeforeSurplusCondition(var ReservEntry: Record "Reservation Entry")
    begin
        ReservEntry."Crop Year" := g_CropYear;
        ReservEntry.Type := g_Type;
        ReservEntry.Form := g_Form;
        ReservEntry."Sub Type" := g_Sub_Type;
        ReservEntry."Nicotine %" := "g_Nicotine_%";
        ReservEntry."Sugar %" := "g_Sugar_%";
        ReservEntry."Internal Grade" := g_Internal_Grade;
        ReservEntry."Shipping Grade" := g_Shipping_Grade;
        ReservEntry."Customer Grade" := g_Customer_Grade;
        ReservEntry."Packing Material" := g_Packing_Material;
        ReservEntry."Kraft/Poly" := "g_Kraft/Poly";
        ReservEntry.Origin := g_Origin;
    end;

    [EventSubscriber(ObjectType::Page, 6510, 'OnAfterCopyTrackingSpec', '', false, false)]
    local procedure OnAfterCopyTrackingSpec(var SourceTrackingSpec: Record "Tracking Specification"; var DestTrkgSpec: Record "Tracking Specification")
    begin
        DestTrkgSpec."Crop Year" := SourceTrackingSpec."Crop Year";
        DestTrkgSpec.Type := SourceTrackingSpec.Type;
        DestTrkgSpec.Form := SourceTrackingSpec.Form;
        DestTrkgSpec."Sub Type" := SourceTrackingSpec."Sub Type";
        DestTrkgSpec."Nicotine %" := SourceTrackingSpec."Nicotine %";
        DestTrkgSpec."Sugar %" := SourceTrackingSpec."Sugar %";
        DestTrkgSpec."Internal Grade" := SourceTrackingSpec."Internal Grade";
        DestTrkgSpec."Shipping Grade" := SourceTrackingSpec."Shipping Grade";
        DestTrkgSpec."Customer Grade" := SourceTrackingSpec."Customer Grade";
        DestTrkgSpec."Packing Material" := SourceTrackingSpec."Packing Material";
        DestTrkgSpec."Kraft/Poly" := SourceTrackingSpec."Kraft/Poly";
        DestTrkgSpec.Origin := SourceTrackingSpec.Origin;
    end;

    [EventSubscriber(ObjectType::Page, 6510, 'OnAfterClearTrackingSpec', '', false, false)]
    local procedure OnAfterClearTrackingSpec(var OldTrkgSpec: Record "Tracking Specification")
    begin
        Clear(OldTrkgSpec."Crop Year");
        OldTrkgSpec.Type := ' ';
        OldTrkgSpec.Form := ' ';
        OldTrkgSpec."Sub Type" := ' ';
        Clear(OldTrkgSpec."Nicotine %");
        Clear(OldTrkgSpec."Sugar %");
        Clear(OldTrkgSpec."Internal Grade");
        Clear(OldTrkgSpec."Shipping Grade");
        Clear(OldTrkgSpec."Customer Grade");
        OldTrkgSpec."Packing Material" := ' ';
        OldTrkgSpec."Kraft/Poly" := ' ';
        OldTrkgSpec.Origin := ' ';

    end;

    [EventSubscriber(ObjectType::Page, 6510, 'OnAfterEntriesAreIdentical', '', false, false)]
    local procedure OnAfterEntriesAreIdentical(ReservEntry1: Record "Reservation Entry"; ReservEntry2: Record "Reservation Entry"; var IdenticalArray: array[2] of Boolean)
    begin
        IdenticalArray[2] := (
                                (ReservEntry1."Crop Year" = ReservEntry2."Crop Year") and
                                (ReservEntry1.Type = ReservEntry2.Type) and
                                (ReservEntry1.Form = ReservEntry2.Form) and
                                (ReservEntry1."Sub Type" = ReservEntry2."Sub Type") and
                                (ReservEntry1."Nicotine %" = ReservEntry2."Nicotine %") and
                                (ReservEntry1."Sugar %" = ReservEntry2."Sugar %") and
                                (ReservEntry1."Internal Grade" = ReservEntry2."Internal Grade") and
                                (ReservEntry1."Shipping Grade" = ReservEntry2."Shipping Grade") and
                                (ReservEntry1."Customer Grade" = ReservEntry2."Customer Grade") and
                                (ReservEntry1."Packing Material" = ReservEntry2."Packing Material") and
                                (ReservEntry1."Kraft/Poly" = ReservEntry2."Kraft/Poly") and
                                (ReservEntry1.Origin = ReservEntry2.Origin));
    end;

    [EventSubscriber(ObjectType::Page, 6510, 'OnAfterMoveFields', '', false, false)]
    local procedure OnAfterMoveFields(var TrkgSpec: Record "Tracking Specification"; var ReservEntry: Record "Reservation Entry")
    begin
        ReservEntry."Crop Year" := TrkgSpec."Crop Year";
        ReservEntry.Type := TrkgSpec.Type;
        ReservEntry.Form := TrkgSpec.Form;
        ReservEntry."Sub Type" := TrkgSpec."Sub Type";
        ReservEntry."Nicotine %" := TrkgSpec."Nicotine %";
        ReservEntry."Sugar %" := TrkgSpec."Sugar %";
        ReservEntry."Internal Grade" := TrkgSpec."Internal Grade";
        ReservEntry."Shipping Grade" := TrkgSpec."Shipping Grade";
        ReservEntry."Customer Grade" := TrkgSpec."Customer Grade";
        ReservEntry."Packing Material" := TrkgSpec."Packing Material";
        ReservEntry."Kraft/Poly" := TrkgSpec."Kraft/Poly";
        ReservEntry.Origin := TrkgSpec.Origin;
    end;


    //--------------Posting Start
    [EventSubscriber(ObjectType::Codeunit, 22, 'OnBeforeInsertSetupTempSplitItemJnlLine', '', false, false)]
    local procedure OnBeforeInsertSetupTempSplitItemJnlLine(var TempTrackingSpecification: Record "Tracking Specification"; var TempItemJournalLine: Record "Item Journal Line"; var PostItemJnlLine: Boolean)
    begin
        TempItemJournalLine."Crop Year" := TempTrackingSpecification."Crop Year";
        TempItemJournalLine.Type1 := TempTrackingSpecification.Type;
        TempItemJournalLine.Form := TempTrackingSpecification.Form;
        TempItemJournalLine."Sub Type" := TempTrackingSpecification."Sub Type";
        TempItemJournalLine."Nicotine %" := TempTrackingSpecification."Nicotine %";
        TempItemJournalLine."Sugar %" := TempTrackingSpecification."Sugar %";
        TempItemJournalLine."Internal Grade" := TempTrackingSpecification."Internal Grade";
        TempItemJournalLine."Shipping Grade" := TempTrackingSpecification."Shipping Grade";
        TempItemJournalLine."Customer Grade" := TempTrackingSpecification."Customer Grade";
        TempItemJournalLine."Packing Material" := TempTrackingSpecification."Packing Material";
        TempItemJournalLine."Kraft/Poly" := TempTrackingSpecification."Kraft/Poly";
        TempItemJournalLine.Origin := TempTrackingSpecification.Origin;
    end;

    [EventSubscriber(ObjectType::Codeunit, 22, 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    begin
        NewItemLedgEntry."Crop Year" := ItemJournalLine."Crop Year";
        NewItemLedgEntry.Type := ItemJournalLine.Type1;
        NewItemLedgEntry.Form := ItemJournalLine.Form;
        NewItemLedgEntry."Sub Type" := ItemJournalLine."Sub Type";
        NewItemLedgEntry."Nicotine %" := ItemJournalLine."Nicotine %";
        NewItemLedgEntry."Sugar %" := ItemJournalLine."Sugar %";
        NewItemLedgEntry."Internal Grade" := ItemJournalLine."Internal Grade";
        NewItemLedgEntry."Shipping Grade" := ItemJournalLine."Shipping Grade";
        NewItemLedgEntry."Customer Grade" := ItemJournalLine."Customer Grade";
        NewItemLedgEntry."Packing Material" := ItemJournalLine."Packing Material";
        NewItemLedgEntry."Kraft/Poly" := ItemJournalLine."Kraft/Poly";
        NewItemLedgEntry.Origin := ItemJournalLine.Origin;
    end;

    //--------------Posting End

    //--------------------------------------------------------------OUTBOUND Start
    procedure GetLotSNDataSet(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; VAR ItemLedgEntry: Record "Item Ledger Entry"): Boolean
    begin
        ItemLedgEntry.Reset();
        ItemLedgEntry.SetCurrentKey("Item No.", Open, "Variant Code", Positive, "Lot No.", "Serial No.");

        ItemLedgEntry.SetRange("Item No.", ItemNo);
        ItemLedgEntry.SetRange(Open, true);
        ItemLedgEntry.SetRange("Variant Code", Variant);
        if LotNo <> '' then
            ItemLedgEntry.SetRange("Lot No.", LotNo)
        else
            if SerialNo <> '' then
                ItemLedgEntry.SetRange("Serial No.", SerialNo);
        ItemLedgEntry.SetRange(Positive, true);

        if ItemLedgEntry.FindLast then
            exit(true);

        ItemLedgEntry.SetRange(Open);
        exit(ItemLedgEntry.FindLast());
    end;

    procedure ExistingCropYear(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; TestMultiple: Boolean; VAR EntriesExist: Boolean) o_CropYear: Integer
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        if not GetLotSNDataSet(ItemNo, Variant, LotNo, SerialNo, ItemLedgEntry) then begin
            EntriesExist := false;
            exit;
        end;

        EntriesExist := true;
        o_CropYear := ItemLedgEntry."Crop Year";

        // IF TestMultiple AND ItemTracingMgt.SpecificTracking(ItemNo, SerialNo, LotNo) THEN BEGIN
        //     ItemLedgEntry.SETFILTER("Expiration Date", '<>%1', ItemLedgEntry."Expiration Date");
        //     ItemLedgEntry.SETRANGE(Open, TRUE);
        //     IF NOT ItemLedgEntry.ISEMPTY THEN
        //         ERROR(Text007, LotNo);
        // END;
    end;

    procedure ExistingType(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; TestMultiple: Boolean; VAR EntriesExist: Boolean) o_Type: option " ",ACB,DAC,DFC,FCV,SAC,KASTHURI,KENTUCKY,"KURNOOL RUSTICA",ORIENTAL,TALMARI,OTHER
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        if not GetLotSNDataSet(ItemNo, Variant, LotNo, SerialNo, ItemLedgEntry) then begin
            EntriesExist := false;
            exit;
        end;

        EntriesExist := true;
        o_Type := ItemLedgEntry.Type;
    end;

    procedure ExistingForm(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; TestMultiple: Boolean; VAR EntriesExist: Boolean) o_Form: option " ",BUNDLES,"BUTTED LOOSE LEAF","BUTTED STRAIGHT LAID LOOSE LEAF","BUTTED TANGLED LOOSE LEAF","EXPANDED STEMS",FINES,"HAND STRIPS","LONG STEMS","LOOSE LEAF","MIXED STEMS","RECONSTITUTED SHEET","REDRIED LOOSE LEAF","REDRIED THRESH",SCRAPS,"SHORT STEMS","SOFT DRIED LOOSE LEAF","STRAIGHT LAID LOOSE LEAF",STRIPS,"TANGLED LOOSE LEAF",OTHER;
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        if not GetLotSNDataSet(ItemNo, Variant, LotNo, SerialNo, ItemLedgEntry) then begin
            EntriesExist := false;
            exit;
        end;

        EntriesExist := true;
        o_Form := ItemLedgEntry.Form;
    end;

    procedure ExistingSub_Type(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; TestMultiple: Boolean; VAR EntriesExist: Boolean) o_Sub_Type: option " ","ACB - HDBRG","ACB - Yeleswaram","DAC - Havana","FCV - Lombok","FCV - Mysore","FCV - NLS","FCV - Traditional","ORIENTAL - Basma","ORIENTAL - Basma Komotini","ORIENTAL - Basma Xanthi","ORIENTAL - Dubek","ORIENTAL - Izmir","ORIENTAL - Kabakoulak","ORIENTAL - Katerini","ORIENTAL - Krumovgrad","ORIENTAL - Nevrokop","ORIENTAL - North Bulgaria","ORIENTAL - Saadi","ORIENTAL - Samsun";
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        if not GetLotSNDataSet(ItemNo, Variant, LotNo, SerialNo, ItemLedgEntry) then begin
            EntriesExist := false;
            exit;
        end;

        EntriesExist := true;
        o_Sub_Type := ItemLedgEntry."Sub Type";
    end;

    procedure ExistingNicotine(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; TestMultiple: Boolean; VAR EntriesExist: Boolean) o_Nicotine: Integer
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        if not GetLotSNDataSet(ItemNo, Variant, LotNo, SerialNo, ItemLedgEntry) then begin
            EntriesExist := false;
            exit;
        end;

        EntriesExist := true;
        o_Nicotine := ItemLedgEntry."Nicotine %";
    end;

    procedure ExistingSugar(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; TestMultiple: Boolean; VAR EntriesExist: Boolean) o_Sugar: Integer
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        if not GetLotSNDataSet(ItemNo, Variant, LotNo, SerialNo, ItemLedgEntry) then begin
            EntriesExist := false;
            exit;
        end;

        EntriesExist := true;
        o_Sugar := ItemLedgEntry."Sugar %";
    end;

    procedure ExistingInternalGrade(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; TestMultiple: Boolean; VAR EntriesExist: Boolean) o_InternalGrade: Text[50]
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        if not GetLotSNDataSet(ItemNo, Variant, LotNo, SerialNo, ItemLedgEntry) then begin
            EntriesExist := false;
            exit;
        end;

        EntriesExist := true;
        o_InternalGrade := ItemLedgEntry."Internal Grade";
    end;

    procedure ExistingShippingGrade(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; TestMultiple: Boolean; VAR EntriesExist: Boolean) o_ShippingGrade: Text[50]
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        if not GetLotSNDataSet(ItemNo, Variant, LotNo, SerialNo, ItemLedgEntry) then begin
            EntriesExist := false;
            exit;
        end;

        EntriesExist := true;
        o_ShippingGrade := ItemLedgEntry."Shipping Grade";
    end;

    procedure ExistingCustomerGrade(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; TestMultiple: Boolean; VAR EntriesExist: Boolean) o_CustomerGrade: Text[50]
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        if not GetLotSNDataSet(ItemNo, Variant, LotNo, SerialNo, ItemLedgEntry) then begin
            EntriesExist := false;
            exit;
        end;

        EntriesExist := true;
        o_CustomerGrade := ItemLedgEntry."Customer Grade";
    end;

    procedure ExistingPackingMaterial(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; TestMultiple: Boolean; VAR EntriesExist: Boolean) o_PackingMaterial: option " ","C48 Kraft Paper T&B","C48 Polyliner",Cartons,"Hessian Bales",Other;
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        if not GetLotSNDataSet(ItemNo, Variant, LotNo, SerialNo, ItemLedgEntry) then begin
            EntriesExist := false;
            exit;
        end;

        EntriesExist := true;
        o_PackingMaterial := ItemLedgEntry."Packing Material";
    end;

    procedure ExistingKraftPoly(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; TestMultiple: Boolean; VAR EntriesExist: Boolean) o_KraftPoly: option " ",Kraft,Poly,Other;
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        if not GetLotSNDataSet(ItemNo, Variant, LotNo, SerialNo, ItemLedgEntry) then begin
            EntriesExist := false;
            exit;
        end;

        EntriesExist := true;
        o_KraftPoly := ItemLedgEntry."Kraft/Poly";
    end;

    procedure ExistingOrigin(ItemNo: Code[20]; Variant: Code[20]; LotNo: Code[50]; SerialNo: Code[50]; TestMultiple: Boolean; VAR EntriesExist: Boolean) o_Origin: option " ",Zim;
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        if not GetLotSNDataSet(ItemNo, Variant, LotNo, SerialNo, ItemLedgEntry) then begin
            EntriesExist := false;
            exit;
        end;

        EntriesExist := true;
        o_Origin := ItemLedgEntry.Origin;
    end;
    //--------------------------------------------------------------OUTBOUND Start

    var
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