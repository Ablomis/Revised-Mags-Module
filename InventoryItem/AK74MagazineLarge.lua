UndefineClass('AK74MagazineLarge')
DefineClass.AK74MagazineLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/expanded_AK74_bakelite_magazine",
	DisplayName = T(263923953709, --[[ModItemInventoryItemCompositeDef AK74MagazineLarge DisplayName]] "AK74 Expanded Magazine"),
	DisplayNamePlural = T(138791525079, --[[ModItemInventoryItemCompositeDef AK74MagazineLarge DisplayNamePlural]] "AK74 Expanded Magazines"),
	Description = T(598530279861, --[[ModItemInventoryItemCompositeDef AK74MagazineLarge Description]] "Expanded AK 74 Magazine for 5.45 round"),
	AdditionalHint = T(241880890162, --[[ModItemInventoryItemCompositeDef AK74MagazineLarge AdditionalHint]] "5.45mm"),
	Cost = 549,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 60,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "AK762",
	MagazineSize = 45,
	Caliber = "762WP",
	Modification = "MagLargeFine",
	Type = "Rifle",
	MagReloadCosts = 30000,
	MagUnloadCosts = 15000,
}

