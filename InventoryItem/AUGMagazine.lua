UndefineClass('AUGMagazine')
DefineClass.AUGMagazine = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/steyr_AUG_magazine",
	DisplayName = T(680307895949, --[[ModItemInventoryItemCompositeDef AUGMagazine DisplayName]] "AUG Magazine"),
	DisplayNamePlural = T(841724768345, --[[ModItemInventoryItemCompositeDef AUGMagazine DisplayNamePlural]] "AUG Magazines"),
	Description = T(408645536277, --[[ModItemInventoryItemCompositeDef AUGMagazine Description]] "Standard AUG Magazine"),
	AdditionalHint = T(226052432153, --[[ModItemInventoryItemCompositeDef AUGMagazine AdditionalHint]] "5.56mm"),
	Cost = 499,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 4,
	RestockWeight = 80,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "AUG",
	Caliber = "556",
	Modification = "MagNormal",
	Type = "Rifle",
	MagReloadCosts = 22000,
	MagUnloadCosts = 11000,
}

