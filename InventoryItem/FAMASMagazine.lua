UndefineClass('FAMASMagazine')
DefineClass.FAMASMagazine = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/expanded_FAMAS_magazine",
	DisplayName = T(397807620775, --[[ModItemInventoryItemCompositeDef FAMASMagazine DisplayName]] "FAMAS Magazine"),
	DisplayNamePlural = T(468811747930, --[[ModItemInventoryItemCompositeDef FAMASMagazine DisplayNamePlural]] "FAMAS Magazines"),
	Description = T(836930527108, --[[ModItemInventoryItemCompositeDef FAMASMagazine Description]] "Standard FAMAS Magazine for the 5.56mm round"),
	AdditionalHint = T(934391465309, --[[ModItemInventoryItemCompositeDef FAMASMagazine AdditionalHint]] "5.56mm"),
	Cost = 449,
	CanAppearInShop = true,
	MaxStock = 6,
	RestockWeight = 90,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "FAMAS",
	MagazineSize = 25,
	Caliber = "556",
	Modification = "MagNormal",
	Type = "Rifle",
	MagReloadCosts = 20000,
	MagUnloadCosts = 10000,
}

