UndefineClass('AK47MagazineMagLarger')
DefineClass.AK47MagazineMagLarger = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/RPK74_drum_magazine",
	DisplayName = T(288540638613, "RPK Drum Magazine"),
	DisplayNamePlural = T(491809893307, "RPK Drum Magazines"),
	Description = T(623103865336, "RPK Drum Magazine"),
	AdditionalHint = T(843188582960, "7.62mm"),
	Cost = 699,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 70,
	CanBeConsumed = false,
	CategoryPair = "MGMags",
	Platform = "AK762",
	MagazineSize = 100,
	Caliber = "762WP",
	Modification = "MagLarger",
	Type = "Rifle",
	ExtraAPCosts = 2000,
	MagReloadCosts = 50000,
}

