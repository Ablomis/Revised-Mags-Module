UndefineClass('BerettaMagazineLarge')
DefineClass.BerettaMagazineLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/beretta_mag_large",
	DisplayName = T(197162323047, --[[ModItemInventoryItemCompositeDef BerettaMagazineLarge DisplayName]] "Extended Beretta Magazine"),
	DisplayNamePlural = T(314509090245, --[[ModItemInventoryItemCompositeDef BerettaMagazineLarge DisplayNamePlural]] "Extended Beretta Magazines"),
	Description = T(773460172429, --[[ModItemInventoryItemCompositeDef BerettaMagazineLarge Description]] "Extended Beretta magazine"),
	AdditionalHint = T(820491098536, --[[ModItemInventoryItemCompositeDef BerettaMagazineLarge AdditionalHint]] "9mm"),
	Cost = 199,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 70,
	CanBeConsumed = false,
	CategoryPair = "PistolMags",
	Platform = "Beretta",
	MagazineSize = 24,
	Caliber = "9mm",
	Modification = "MagLarge",
	Type = "Pistol",
	MagReloadCosts = 16000,
	MagUnloadCosts = 8000,
}

