function REV_GetMagazineClassByPlatformAndModification(platform, modification, any)
	local magazine = REV_GetMagazineByPlatformAndModification(platform, modification, any)

	return magazine and magazine.class or false
end

function REV_GetMagazineByPlatformAndModification(platform, modification, any)
	local magazine
	local magazines = Presets.InventoryItemCompositeDef.Default
	for _, mag in ipairs(magazines) do
		if mag.Platform == platform and mag.Modification == modification then
			magazine = mag
			break
		end
	end
	if not magazine and any then
		for _, mag in ipairs(magazines) do
			if mag.Platform == platform then
				magazine = mag
				break
			end
		end
	end
	return magazine
end

function REV_GetMagById(unit, mag_id)
	local mag
	unit:ForEachItemInSlot("Inventory", function(item)
		if item:IsKindOf("Mag") and item.id == mag_id then
			mag = item
		end
	end, mag)
	return mag
end

function REV_GetMagByPlatformAndCaliber(unit, platform, caliber)
	local mag
	unit:ForEachItemInSlot("Inventory", function(item)
		if item:IsKindOf("Mag") and item.Platform == platform and item.caliber == caliber then
			mag = item
		end
	end, mag)
	return mag
end

function REV_GetBestMagForWeapon(unit, weapon, args)
	local mags = REV_GetMagsForWeapon(unit, weapon, args)
	local bestMag
	for i, mag in ipairs(mags) do
		if not bestMag or bestMag.ammo.Amount < mag.ammo.Amount then
			bestMag = mag
		end
	end
	return bestMag
end

function REV_GetMagsForWeapon(unit, weapon, args)
	local notEmpty = args and args.notEmpty
	local sameType = args and args.sameType
	local mag_list = {}
	unit:ForEachItemInSlot("Inventory", function(item)
		if IsKindOf(item, "Mag") and item.Platform == weapon.Platform and item.Caliber == weapon.Caliber then
			if notEmpty and (not item.ammo or item.ammo and item.ammo.Amount < 0) then
				goto continue
			end

			if weapon.ammo and sameType and (item.ammo.class and weapon.ammo.class) then
				goto continue
			end

			table.insert(mag_list, item)

			::continue::
		end
	end, mag_list)
	return mag_list
end

function REV_GetMagReloadOptionsForWeapon(weapon, unit, includeEmpty, combat)
	if not unit and #Selection == 0 then
		return {}
	end
	unit = unit or Selection[1]
	local weapons = {}
	weapons[#weapons + 1] = weapon
	local options = {}
	local errors = {}
	local args = {}
	if not includeEmpty then
		args.notEmpty = true
	end
	for _, wpn in ipairs(weapons) do
		local availableMags = REV_GetMagsForWeapon(unit, wpn, args, combat)
		local availableForMag, errMag = IsWeaponAvailableForReload(wpn, availableMags) --probably not needed
		if availableForMag then
			for i, mag in ipairs(availableMags) do
				if combat then
					local ap = REV_GetReloadAP(unit, wpn, mag, "MagMode")
					if not unit:UIHasAP(ap) then
						goto continue
					end
				end

				options[#options + 1] = { weapon = wpn, ammo = mag }

				::continue::
			end
		else
			errors[wpn] = errMag
		end
	end
	return options, errors
end

function REV_IsReloadWithMagEnabled(context)
	local obj = context.item
	local unit = context.unit

	local mags = REV_GetMagsForWeapon(unit, obj)

	if mags and #mags < 1 then
		return false
	end

	local magWithLowestAPCost

	for i, mag in ipairs(mags) do
		if mag.ExtraAPCosts == 0 then
			magWithLowestAPCost = mag
			break
		end

		if not magWithLowestAPCost or mag.ExtraAPCosts < magWithLowestAPCost.ExtraAPCosts then
			magWithLowestAPCost = mag
		end
	end

	local container = context.context

	local pos = container and container:GetItemPackedPos(obj)

	local args = {
		weapon = obj.class,
		item_id = obj.id,
		item = magWithLowestAPCost,
		mode = "MagMode",
		ammo_id = magWithLowestAPCost.id,
		pos = pos
	}

	local ap = CombatActions.Reload:GetAPCost(unit, args)

	if unit:UIHasAP(ap) then
		return true
	end

	return false
end

function REV_MagReloadWeapon(unit, gun, mag, delayed_fx, ai)
	local reloaded
	local prev, playedFX, change
	prev, playedFX, change = gun:Reload(mag, nil, delayed_fx)
	local vo = gun:GetVisualObj()
	if (change or ai) and vo and not playedFX then
		CreateGameTimeThread(function(weapon, obj, delayed_fx)
			--Added randomness for weapon reload to cover the case with all mercs reloading on combat end or ReloadMultiSelection shortcut(both are during unpaused game)
			if delayed_fx then
				Sleep(InteractionRand(500, "ReloadDelay"))
			end
			if GetMercInventoryDlg() then
				PlayFX("WeaponLoad", "start", obj.object_class or (obj.weapon and obj.weapon.object_class), obj)
			else
				local actor_class = obj.fx_actor_class
				obj.fx_actor_class = weapon.class
				PlayFX("WeaponReload", "start", obj)
				obj.fx_actor_class = actor_class
			end
		end, gun, vo, delayed_fx)
		playedFX = true
	end
	ai = false
	reloaded = true
	ObjModified(mag)
	Msg("WeaponReloaded", unit)
	ObjModified("WeaponReloaded")
	return reloaded
end
