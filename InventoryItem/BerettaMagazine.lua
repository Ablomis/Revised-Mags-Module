UndefineClass('BerettaMagazine')
DefineClass.BerettaMagazine = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/beretta_mag_normal",
	DisplayName = T(864507774814, --[[ModItemInventoryItemCompositeDef BerettaMagazine DisplayName]] "Beretta Magazine"),
	DisplayNamePlural = T(416317621832, --[[ModItemInventoryItemCompositeDef BerettaMagazine DisplayNamePlural]] "Beretta Magazines"),
	Description = T(702680870997, --[[ModItemInventoryItemCompositeDef BerettaMagazine Description]] "Standard Beretta magazine"),
	AdditionalHint = T(971567342173, --[[ModItemInventoryItemCompositeDef BerettaMagazine AdditionalHint]] "9mm"),
	Cost = 99,
	CanAppearInShop = true,
	MaxStock = 6,
	RestockWeight = 90,
	CanBeConsumed = false,
	CategoryPair = "PistolMags",
	Platform = "Beretta",
	MagazineSize = 15,
	Caliber = "9mm",
	Modification = "MagNormal",
	Type = "Pistol",
}

