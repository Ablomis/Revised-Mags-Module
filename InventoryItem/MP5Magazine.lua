UndefineClass('MP5Magazine')
DefineClass.MP5Magazine = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/mp5_mag_normal",
	DisplayName = T(380067518258, "Small MP5 Magazine"),
	DisplayNamePlural = T(855060268788, "Small MP5 Magazines"),
	Description = T(183827799514, "Small MP5 Magazine"),
	AdditionalHint = T(934759206980, "9mm"),
	Cost = 249,
	CanAppearInShop = true,
	MaxStock = 4,
	RestockWeight = 90,
	CanBeConsumed = false,
	CategoryPair = "SMGMags",
	Platform = "MP5",
	MagazineSize = 15,
	Caliber = "9mm",
	Modification = "MagNormal",
	Type = "Pistol",
}

