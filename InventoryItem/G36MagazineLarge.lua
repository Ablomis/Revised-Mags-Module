UndefineClass('G36MagazineLarge')
DefineClass.G36MagazineLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/G36_magazine",
	DisplayName = T(241702335876, --[[ModItemInventoryItemCompositeDef G36MagazineLarge DisplayName]] "G36 Magazine"),
	DisplayNamePlural = T(216085238153, --[[ModItemInventoryItemCompositeDef G36MagazineLarge DisplayNamePlural]] "G36 Magazines"),
	Description = T(353746051262, --[[ModItemInventoryItemCompositeDef G36MagazineLarge Description]] "Standard Magazine for G36"),
	AdditionalHint = T(490528401416, --[[ModItemInventoryItemCompositeDef G36MagazineLarge AdditionalHint]] "5.56mm"),
	Cost = 499,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 4,
	RestockWeight = 80,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "G36",
	Caliber = "556",
	Modification = "MagLarge",
	Type = "Rifle",
	MagReloadCosts = 22000,
	MagUnloadCosts = 11000,
}

