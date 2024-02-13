UndefineClass('FNMinimiMagazineLarge')
DefineClass.FNMinimiMagazineLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/machine_gun_box_magazine",
	DisplayName = T(601950860008, --[[ModItemInventoryItemCompositeDef FNMinimiMagazineLarge DisplayName]] "FNMinimi Magazine"),
	DisplayNamePlural = T(586364397393, --[[ModItemInventoryItemCompositeDef FNMinimiMagazineLarge DisplayNamePlural]] "FNMinimi Magazines"),
	Description = T(985346745546, --[[ModItemInventoryItemCompositeDef FNMinimiMagazineLarge Description]] "Standard FNMinimi magazine for 5.56 round"),
	AdditionalHint = T(853659506906, --[[ModItemInventoryItemCompositeDef FNMinimiMagazineLarge AdditionalHint]] "5.56mm"),
	Cost = 599,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 80,
	CanBeConsumed = false,
	CategoryPair = "MGMags",
	Platform = "SAW",
	MagazineSize = 100,
	Caliber = "556",
	Modification = "MagLarger",
	Type = "Large",
	ExtraAPCosts = 4000,
	MagReloadCosts = 55000,
	MagUnloadCosts = 10000,
}

