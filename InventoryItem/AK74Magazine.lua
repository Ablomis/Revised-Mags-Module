UndefineClass('AK74Magazine')
DefineClass.AK74Magazine = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/AK74_Bakelite_magazine",
	DisplayName = T(944939391173, --[[ModItemInventoryItemCompositeDef AK74Magazine DisplayName]] "AK74 Magazine"),
	DisplayNamePlural = T(176064522679, --[[ModItemInventoryItemCompositeDef AK74Magazine DisplayNamePlural]] "AK74 Magazines"),
	Description = T(730820981523, --[[ModItemInventoryItemCompositeDef AK74Magazine Description]] "Standard AK 74 Magazine for 5.45 round also used by AKSU"),
	AdditionalHint = T(284899607406, --[[ModItemInventoryItemCompositeDef AK74Magazine AdditionalHint]] "5.45mm"),
	Cost = 399,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 80,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "AK762",
	Caliber = "762WP",
	Modification = "MagNormalFine",
	Type = "Rifle",
	MagReloadCosts = 22000,
	MagUnloadCosts = 11000,
}

