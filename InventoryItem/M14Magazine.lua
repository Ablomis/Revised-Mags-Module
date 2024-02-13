UndefineClass('M14Magazine')
DefineClass.M14Magazine = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/M14_magazine",
	DisplayName = T(419258536921, --[[ModItemInventoryItemCompositeDef M14Magazine DisplayName]] "M14 Magazine"),
	DisplayNamePlural = T(748039484649, --[[ModItemInventoryItemCompositeDef M14Magazine DisplayNamePlural]] "M14 Magazines"),
	Description = T(307163251257, --[[ModItemInventoryItemCompositeDef M14Magazine Description]] "M14 Magazin"),
	AdditionalHint = T(593147163304, --[[ModItemInventoryItemCompositeDef M14Magazine AdditionalHint]] "7.62mm NATO"),
	Cost = 349,
	CanAppearInShop = true,
	MaxStock = 5,
	RestockWeight = 80,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "M14",
	MagazineSize = 10,
	Caliber = "762NATO",
	Modification = "MagNormal",
	Type = "Rifle",
	MagReloadCosts = 12000,
	MagUnloadCosts = 6000,
}

