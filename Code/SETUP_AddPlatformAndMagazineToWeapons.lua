function REV_SetupWeapon(weaponClass, plattform, mag, defaultMod, availableMods)
	
	weaponClass.Platform = plattform
	weaponClass.Magazine = mag
	
	local componentSlots = weaponClass.ComponentSlots

	for i, slot in ipairs(componentSlots) do
		if slot.SlotType == "Magazine" then
			slot.DefaultComponent = defaultMod
			slot.AvailableComponents = availableMods
		end
	end

	weaponClass.MagazineSize = 0
end

function OnMsg.ClassesGenerate()
	AppendClass.Firearm = {
		{
			id = "Platform",
			category = "Caliber",
			template = true,
			default = 'AR15',
			editor = "text"
		},
		{
			category = "Caliber",
			id = "Magazine",
			editor = "combo",
			default = false,
			template = true,
			modifiable = true,
			items = function(self)
				local presetsMagazines = Presets.InventoryItemCompositeDef.Default

				local presetMagazineIds = {}

				for id, presetsMagazine in ipairs(presetsMagazines) do
					if type(presetsMagazine) == "table" and IsKindOf(presetsMagazine, "Mag") and presetsMagazine.Platform == self.Platform then
						table.insert(presetMagazineIds, presetsMagazine.class)
					end
				end

				return presetMagazineIds
			end
		}
	}

	AppendClass.FirearmBase = {
		magazine = false
	}

	REV_SetupWeapon(HiPower, "HiPower", "BHPMagazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(Bereta92, "Beretta", "BerettaMagazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(Glock18, "Glock", "GlockMagazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(DesertEagle, "DesertEagle", "DesertEagleMagazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(UZI, "UZI", "UZIMagazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(LionRoar, "UZI", "UZIMagazine", "MagLarge", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(MP5, "MP5", "MP5Magazine", "MagLarge", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(MP5K, "MP5", "MP5Magazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(MP40, "MP40", "MP40Magazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(AKSU, "AK545", "AK74Magazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(M4Commando, "AR15", "STANAGMagazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(AK74, "AK545", "AK74Magazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(AK47, "AK762", "AK47Magazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(FAMAS, "FAMAS", "FAMASMagazine", "MagNormal", {"MagNormal"})
	REV_SetupWeapon(AR15, "AR15", "STANAGMagazine", "MagLarge", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(M16A2, "AR15", "STANAGMagazine", "MagLarge", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(AUG, "AUG", "AUGMagazine", "MagNormal", {"MagNormal", "MagLarge"})
	REV_SetupWeapon(FNFAL, "FNFAL", "FNFALMagazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(Galil, "Galil", "GalilMagazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(Galil_FlagHill, "Galil", "GalilMagazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(G36, "G36", "G36MagazineLarge", "MagLarge", {"MagLarger", "MagLarge"})
	REV_SetupWeapon(M14SAW, "M14", "M14Magazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(GoldenGun, "M14", "M14Magazine", "MagNormal", {"MagLarge", "MagNormal"})
	-- REV_SetupWeapon(M24Sniper, "M14", "M14Magazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(PSG1, "HKG3", "HKG3Magazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(DragunovSVD, "SVD", "SVDMagazine", "MagNormal", {"MagNormal"})
	REV_SetupWeapon(BarretM82, "BarretM82", "BarretM82Magazine", "MagNormal", {"MagLarge", "MagNormal"})
	REV_SetupWeapon(RPK74, "AK762", "AK47MagazineLarge", "MagLarge", {"MagLarge", "MagLarger", "MagNormal"})
	REV_SetupWeapon(HK21, "HKG3", "HKG3MagazineLarge", "MagLarge", {"MagLarger", "MagLarge"})
	REV_SetupWeapon(FNMinimi, "SAW", "FNMinimiMagazineLarge", "MagLarge", {"MagLarge", "MagLarger"})
	REV_SetupWeapon(AA12, "AA12", "AA12Magazine", "MagNormal", {"MagLarge", "MagNormal"})

	

	Msg("RevisedMagPropsAddedToFirearms")
end

