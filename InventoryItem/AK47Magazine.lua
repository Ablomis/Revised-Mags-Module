UndefineClass('AK47Magazine')
DefineClass.AK47Magazine = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/AK47_magazine",
	DisplayName = T(197994505354, --[[ModItemInventoryItemCompositeDef AK47Magazine DisplayName]] "AK47 Magazine"),
	DisplayNamePlural = T(256521754595, --[[ModItemInventoryItemCompositeDef AK47Magazine DisplayNamePlural]] "AK47 Magazines"),
	Description = T(303524049456, --[[ModItemInventoryItemCompositeDef AK47Magazine Description]] "Standard AK 47 Magazine for 7.62 round"),
	AdditionalHint = T(413761107136, --[[ModItemInventoryItemCompositeDef AK47Magazine AdditionalHint]] "7.62mm"),
	Cost = 349,
	CanAppearInShop = true,
	MaxStock = 6,
	RestockWeight = 90,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "AK762",
	Caliber = "762WP",
	Modification = "MagNormal",
	Type = "Rifle",
	MagReloadCosts = 22000,
	MagUnloadCosts = 11000,
}

