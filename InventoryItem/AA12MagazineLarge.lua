UndefineClass('AA12MagazineLarge')
DefineClass.AA12MagazineLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/aa12_mag_drum",
	DisplayName = T(372895830190, "AA12 Drum Magazine"),
	DisplayNamePlural = T(281581449031, "AA12 Drum Magazines"),
	Description = T(528516420382, "Drum AA12 magazine"),
	AdditionalHint = T(946631619926, "12gauge"),
	Cost = 599,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 60,
	CanBeConsumed = false,
	CategoryPair = "OtherMags",
	Platform = "AA12",
	MagazineSize = 20,
	Caliber = "12gauge",
	Modification = "MagLarge",
	Type = "Large",
	MagReloadCosts = 20000,
	MagUnloadCosts = 10000,
}

