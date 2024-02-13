UndefineClass('HKG3MagazineLarger')
DefineClass.HKG3MagazineLarger = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/hk21_mag_large",
	DisplayName = T(943859599380, "HK21 Magazine large"),
	DisplayNamePlural = T(617753593554, "HK21 Magazines large"),
	Description = T(662486512433, "Large HK21 magazine for 7.62 NATO round"),
	AdditionalHint = T(298144314218, "7.62mm NATO"),
	Cost = 699,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 60,
	CanBeConsumed = false,
	CategoryPair = "MGMags",
	Platform = "HKG3",
	MagazineSize = 100,
	Caliber = "762NATO",
	Modification = "MagLarger",
	Type = "Large",
	ExtraAPCosts = 4000,
	MagReloadCosts = 55000,
	MagUnloadCosts = 10000,
}

