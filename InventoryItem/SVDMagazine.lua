UndefineClass('SVDMagazine')
DefineClass.SVDMagazine = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/dragunov_mag_normal",
	DisplayName = T(694366750538, --[[ModItemInventoryItemCompositeDef SVDMagazine DisplayName]] "SVD Magazine"),
	DisplayNamePlural = T(350262067108, --[[ModItemInventoryItemCompositeDef SVDMagazine DisplayNamePlural]] "SVD Magazines"),
	Description = T(680220331718, --[[ModItemInventoryItemCompositeDef SVDMagazine Description]] "Standard SVD magazine"),
	AdditionalHint = T(757416315650, --[[ModItemInventoryItemCompositeDef SVDMagazine AdditionalHint]] "7.62mm WP"),
	Cost = 449,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 80,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Platform = "SVD",
	MagazineSize = 10,
	Caliber = "762WP",
	Modification = "MagNormal",
	Type = "Rifle",
	MagReloadCosts = 12000,
	MagUnloadCosts = 6000,
}

