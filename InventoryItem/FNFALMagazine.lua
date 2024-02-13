UndefineClass('FNFALMagazine')
DefineClass.FNFALMagazine = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "Mod/URkxyfE/magpictures/fnfal_normal.png",
	DisplayName = T(650432458305, --[[ModItemInventoryItemCompositeDef FNFALMagazine DisplayName]] "FNFAL Magazine"),
	DisplayNamePlural = T(994364457929, --[[ModItemInventoryItemCompositeDef FNFALMagazine DisplayNamePlural]] "FNFAL Magazines"),
	Description = T(479791052605, --[[ModItemInventoryItemCompositeDef FNFALMagazine Description]] "Standard FNFAL Magazine for the 7.62mm round"),
	AdditionalHint = T(383494416041, --[[ModItemInventoryItemCompositeDef FNFALMagazine AdditionalHint]] "7.62mm NATO"),
	Cost = 449,
	CanAppearInShop = true,
	RestockWeight = 80,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "FNFAL",
	MagazineSize = 20,
	Caliber = "762NATO",
	Modification = "MagNormal",
	Type = "Rifle",
	MagReloadCosts = 18000,
	MagUnloadCosts = 9000,
}

