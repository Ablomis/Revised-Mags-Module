UndefineClass('BarretM82Magazine')
DefineClass.BarretM82Magazine = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "Mod/URkxyfE/magpictures/M82_mag_normal.png",
	DisplayName = T(480663085177, --[[ModItemInventoryItemCompositeDef BarretM82Magazine DisplayName]] "BarretM82 Magazine"),
	DisplayNamePlural = T(332358561336, --[[ModItemInventoryItemCompositeDef BarretM82Magazine DisplayNamePlural]] "BarretM82 Magazines"),
	Description = T(470374936555, --[[ModItemInventoryItemCompositeDef BarretM82Magazine Description]] "Standard BarretM82 magazine"),
	AdditionalHint = T(184473771816, --[[ModItemInventoryItemCompositeDef BarretM82Magazine AdditionalHint]] "50BMG"),
	Cost = 499,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 80,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "BarretM82",
	MagazineSize = 5,
	Caliber = "50BMG",
	Modification = "MagNormal",
	Type = "Rifle",
	MagReloadCosts = 12000,
	MagUnloadCosts = 6000,
}

