UndefineClass('BarretM82MagazineLarge')
DefineClass.BarretM82MagazineLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "Mod/URkxyfE/magpictures/M82_mag_large.png",
	DisplayName = T(346444667903, --[[ModItemInventoryItemCompositeDef BarretM82MagazineLarge DisplayName]] "BarretM82 Magazine"),
	DisplayNamePlural = T(928637668402, --[[ModItemInventoryItemCompositeDef BarretM82MagazineLarge DisplayNamePlural]] "BarretM82 Magazines"),
	Description = T(933482280309, --[[ModItemInventoryItemCompositeDef BarretM82MagazineLarge Description]] "Standard BarretM82 magazine"),
	AdditionalHint = T(588048423283, --[[ModItemInventoryItemCompositeDef BarretM82MagazineLarge AdditionalHint]] "50BMG"),
	Cost = 899,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 60,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "BarretM82",
	MagazineSize = 10,
	Caliber = "50BMG",
	Modification = "MagLarge",
	Type = "Rifle",
	MagReloadCosts = 20000,
	MagUnloadCosts = 10000,
}

