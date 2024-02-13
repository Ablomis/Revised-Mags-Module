UndefineClass('MP40MagazineLarge')
DefineClass.MP40MagazineLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/expanded_MP40_magazine",
	DisplayName = T(269409484176, --[[ModItemInventoryItemCompositeDef MP40MagazineLarge DisplayName]] "Extended MP40 Magazine"),
	DisplayNamePlural = T(777100244676, --[[ModItemInventoryItemCompositeDef MP40MagazineLarge DisplayNamePlural]] "Extended MP40 Magazines"),
	Description = T(214388360902, --[[ModItemInventoryItemCompositeDef MP40MagazineLarge Description]] "Extended MP40 magazine"),
	AdditionalHint = T(204120668109, --[[ModItemInventoryItemCompositeDef MP40MagazineLarge AdditionalHint]] "9mm"),
	Cost = 449,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 70,
	CanBeConsumed = false,
	CategoryPair = "SMGMags",
	Platform = "MP40",
	MagazineSize = 42,
	Caliber = "9mm",
	Modification = "MagLarge",
	Type = "Rifle",
	MagReloadCosts = 22000,
	MagUnloadCosts = 11000,
}

