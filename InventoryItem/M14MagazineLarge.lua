UndefineClass('M14MagazineLarge')
DefineClass.M14MagazineLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/expanded_M14_magazine",
	DisplayName = T(330983046837, --[[ModItemInventoryItemCompositeDef M14MagazineLarge DisplayName]] "Extended M14 Magazine"),
	DisplayNamePlural = T(517758768368, --[[ModItemInventoryItemCompositeDef M14MagazineLarge DisplayNamePlural]] "Extended M14 Magazines"),
	Description = T(229239844615, --[[ModItemInventoryItemCompositeDef M14MagazineLarge Description]] "Extended M14 Magazin"),
	AdditionalHint = T(649358195253, --[[ModItemInventoryItemCompositeDef M14MagazineLarge AdditionalHint]] "7.62mm NATO"),
	Cost = 449,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 70,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "M14",
	MagazineSize = 20,
	Caliber = "762NATO",
	Modification = "MagLarge",
	Type = "Rifle",
	MagReloadCosts = 20000,
	MagUnloadCosts = 10000,
}

