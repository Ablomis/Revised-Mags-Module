UndefineClass('HKG3MagazineLarge')
DefineClass.HKG3MagazineLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "Mod/URkxyfE/magpictures/g3_expanded.png",
	DisplayName = T(906480252330, "HK21 Magazine"),
	DisplayNamePlural = T(254435009704, "HK21 Magazines"),
	Description = T(565422177836, "HK21 magazine for 7.62 NATO round"),
	AdditionalHint = T(743853421491, "7.62mm NATO"),
	Cost = 449,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 80,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "HKG3",
	MagazineSize = 20,
	Caliber = "762NATO",
	Modification = "MagLarge",
	Type = "Rifle",
	MagReloadCosts = 18000,
	MagUnloadCosts = 9000,
}

