UndefineClass('STANAGMagazine')
DefineClass.STANAGMagazine = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "Mod/URkxyfE/magpictures/m4_mag_normal.png",
	DisplayName = T(297754309466, --[[ModItemInventoryItemCompositeDef STANAGMagazine DisplayName]] "STANAG Magazine"),
	DisplayNamePlural = T(280496470685, --[[ModItemInventoryItemCompositeDef STANAGMagazine DisplayNamePlural]] "STANAG Magazines"),
	Description = T(319440802232, --[[ModItemInventoryItemCompositeDef STANAGMagazine Description]] "Standard STANAG Magazine for 5.56 round"),
	AdditionalHint = T(760146909250, --[[ModItemInventoryItemCompositeDef STANAGMagazine AdditionalHint]] "5.56mm"),
	Cost = 499,
	CanAppearInShop = true,
	MaxStock = 6,
	RestockWeight = 90,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	MagazineSize = 20,
	Caliber = "556",
	Modification = "MagNormal",
	Type = "Rifle",
	MagReloadCosts = 18000,
	MagUnloadCosts = 9000,
}

