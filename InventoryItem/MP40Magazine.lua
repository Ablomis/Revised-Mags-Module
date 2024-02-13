UndefineClass('MP40Magazine')
DefineClass.MP40Magazine = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "Mod/URkxyfE/magpictures/MP40_mag_normal.png",
	DisplayName = T(670950948161, --[[ModItemInventoryItemCompositeDef MP40Magazine DisplayName]] "MP40 Magazine"),
	DisplayNamePlural = T(106021205921, --[[ModItemInventoryItemCompositeDef MP40Magazine DisplayNamePlural]] "MP40 Magazines"),
	Description = T(954219452157, --[[ModItemInventoryItemCompositeDef MP40Magazine Description]] "MP40 magazine"),
	AdditionalHint = T(367126411924, --[[ModItemInventoryItemCompositeDef MP40Magazine AdditionalHint]] "9mm"),
	Cost = 349,
	CanAppearInShop = true,
	MaxStock = 5,
	RestockWeight = 90,
	CanBeConsumed = false,
	CategoryPair = "SMGMags",
	Platform = "MP40",
	MagazineSize = 32,
	Caliber = "9mm",
	Modification = "MagNormal",
	Type = "Rifle",
	MagReloadCosts = 18000,
	MagUnloadCosts = 9000,
}

