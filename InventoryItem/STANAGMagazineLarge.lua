UndefineClass('STANAGMagazineLarge')
DefineClass.STANAGMagazineLarge = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/m16_magazine",
	DisplayName = T(470988243825, --[[ModItemInventoryItemCompositeDef STANAGMagazineLarge DisplayName]] "Extended STANAG Magazine"),
	DisplayNamePlural = T(702075557653, --[[ModItemInventoryItemCompositeDef STANAGMagazineLarge DisplayNamePlural]] "Extended STANAG Magazines"),
	Description = T(173560130045, --[[ModItemInventoryItemCompositeDef STANAGMagazineLarge Description]] "Extended STANAG Magazine for 5.56 round"),
	AdditionalHint = T(676533745102, --[[ModItemInventoryItemCompositeDef STANAGMagazineLarge AdditionalHint]] "5.56mm"),
	Cost = 599,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 70,
	CanBeConsumed = false,
	CategoryPair = "RifleMags",
	Caliber = "556",
	Modification = "MagLarge",
	Type = "Rifle",
	MagReloadCosts = 22000,
	MagUnloadCosts = 11000,
}

