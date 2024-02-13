UndefineClass('AK47MagazineMagLarge')
DefineClass.AK47MagazineMagLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/expanded_AK47_magazine",
	DisplayName = T(746528289938, --[[ModItemInventoryItemCompositeDef AK47MagazineMagLarge DisplayName]] "AK47 Magazine Large"),
	DisplayNamePlural = T(381725812126, --[[ModItemInventoryItemCompositeDef AK47MagazineMagLarge DisplayNamePlural]] "AK47 Magazines Large"),
	Description = T(579300305909, --[[ModItemInventoryItemCompositeDef AK47MagazineMagLarge Description]] "Expanded AK 47 Magazine for 7.62 round used as default for RPK"),
	AdditionalHint = T(477705021835, --[[ModItemInventoryItemCompositeDef AK47MagazineMagLarge AdditionalHint]] "7.62mm"),
	Cost = 449,
	CanAppearInShop = true,
	RestockWeight = 80,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "AK762",
	MagazineSize = 45,
	Caliber = "762WP",
	Modification = "MagLarge",
	Type = "Rifle",
	MagReloadCosts = 28000,
	MagUnloadCosts = 14000,
}

