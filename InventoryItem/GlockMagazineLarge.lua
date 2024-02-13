UndefineClass('GlockMagazineLarge')
DefineClass.GlockMagazineLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/glock_mag_large",
	DisplayName = T(396993697244, "Extended Glock Magazine"),
	DisplayNamePlural = T(420296576604, "Extended Glock Magazines"),
	Description = T(697240786727, "Extended Glock magazine"),
	AdditionalHint = T(767077445666, "9mm"),
	Cost = 199,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 70,
	CanBeConsumed = false,
	CategoryPair = "PistolMags",
	Platform = "Glock",
	MagazineSize = 24,
	Caliber = "9mm",
	Modification = "MagLarge",
	Type = "Pistol",
	MagReloadCosts = 16000,
	MagUnloadCosts = 8000,
}

