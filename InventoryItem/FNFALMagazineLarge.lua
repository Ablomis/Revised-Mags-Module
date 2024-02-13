UndefineClass('FNFALMagazineLarge')
DefineClass.FNFALMagazineLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "Mod/URkxyfE/magpictures/fnfal_expanded.png",
	DisplayName = T(591226334130, "FNFAL Magazine"),
	DisplayNamePlural = T(123423196816, "FNFAL Magazines"),
	Description = T(137608804060, "Standard FNFAL Magazine for the 7.62mm round"),
	AdditionalHint = T(574318320309, "7.62mm NATO"),
	Cost = 599,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 60,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "FNFAL",
	Caliber = "762NATO",
	Modification = "MagLarge",
	Type = "Rifle",
	MagReloadCosts = 24000,
	MagUnloadCosts = 12000,
}

