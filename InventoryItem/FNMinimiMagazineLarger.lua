UndefineClass('FNMinimiMagazineLarger')
DefineClass.FNMinimiMagazineLarger = {
	__parents = { "Mag" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Mag",
	ScrapParts = 3,
	Repairable = false,
	Icon = "UI/Icons/Upgrades/fnminimi_mag_large",
	DisplayName = T(354184430796, --[[ModItemInventoryItemCompositeDef FNMinimiMagazineLarger DisplayName]] "FNMinimi Magazine"),
	DisplayNamePlural = T(317595853153, --[[ModItemInventoryItemCompositeDef FNMinimiMagazineLarger DisplayNamePlural]] "FNMinimi Magazines"),
	Description = T(242577590850, --[[ModItemInventoryItemCompositeDef FNMinimiMagazineLarger Description]] "Large FNMinimi magazine for 5.56 round"),
	AdditionalHint = T(266706146245, --[[ModItemInventoryItemCompositeDef FNMinimiMagazineLarger AdditionalHint]] "5.56mm"),
	Cost = 799,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 60,
	CanBeConsumed = false,
	CategoryPair = "MGMags",
	Platform = "SAW",
	MagazineSize = 150,
	Caliber = "556",
	Modification = "MagLarge",
	Type = "Large",
	ExtraAPCosts = 4000,
	MagReloadCosts = 60000,
	MagUnloadCosts = 15000,
}

