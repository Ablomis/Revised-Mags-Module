UndefineClass('G36MagazineLarger')
DefineClass.G36MagazineLarger = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/expanded_drum_G36_magazine",
	DisplayName = T(421339476130, "G36 Drum Magazine"),
	DisplayNamePlural = T(255695106893, "G36 Drum Magazines"),
	Description = T(956629558068, "Drum Magazine for G36"),
	AdditionalHint = T(134197212893, "5.56mm"),
	Cost = 799,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 60,
	CanBeConsumed = false,
	CategoryPair = "MGMags",
	Platform = "G36",
	MagazineSize = 100,
	Caliber = "556",
	Modification = "MagLarger",
	Type = "Large",
	ExtraAPCosts = 2000,
	MagReloadCosts = 50000,
}

