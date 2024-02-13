function REV_GetMagUnloadCosts(unit, item)
	-- TODO: adding dexterity bonus

	if not item.Magazine and not IsKindOf(item, "Mag") then
		return item.ReloadAP
	end

	if IsKindOf(item, "Firearm") then
		item = item.magazine
	end

	local unloadBullets = item.ammo and item.ammo.Amount or 0

	local unloadAPperBullet = round((item.MagUnloadCosts or item.MagReloadCosts / 2) / item.MagazineSize, 1)

	return unloadAPperBullet * unloadBullets
end

function REV_GetMagReloadCosts(unit, mag, ammo, use_more, ap)

	if not ammo then
		return 0, 0, 0
	end

	local unitAPleft = ap or unit:GetUIActionPoints()

	if (unitAPleft < const.Scale.AP) then
		return 0, 0, 0
	end

	local ammo_items, total_rounds = REV_GetAmmoItems(unit, ammo, use_more)

	local change = not mag.ammo or mag.ammo.class ~= ammo.class

	local addBullets = change and Min(mag.MagazineSize, total_rounds) or
		Min(mag.MagazineSize - (mag.ammo and mag.ammo.Amount or 0), total_rounds)

	local unloadBullets = change and mag.ammo and mag.ammo.Amount or 0

	local reloadAPperBullet = round(mag.MagReloadCosts / mag.MagazineSize, 1)

	local unloadAPperBullet = round((mag.MagUnloadCosts or mag.MagReloadCosts / 2) / mag.MagazineSize, 1)

	local reloadCosts = 0

	if unloadBullets > 0 then
		local doableUnloads = round(unitAPleft / unloadAPperBullet, 1)

		if doableUnloads < unloadBullets then
			unloadBullets = doableUnloads
		end

		reloadCosts = unloadAPperBullet * unloadBullets

		unitAPleft = unitAPleft - reloadCosts
	end

	if (unitAPleft < const.Scale.AP) then
		return reloadCosts, 0, unloadBullets
	end

	local doableReloads = round(unitAPleft / reloadAPperBullet, 1)

	if doableReloads < addBullets then
		addBullets = doableReloads
	end

	reloadCosts = reloadCosts + reloadAPperBullet * addBullets

	return reloadCosts, addBullets, unloadBullets
end

function REV_GetTotalRounds(ammo_items)
	local total = 0
	for _, ammo in ipairs(ammo_items) do
		if ammo then
			total = total + ammo.Amount
		end
	end
	return total
end

function REV_GetAmmoItems(unit, ammo, use_more)
	if not use_more then
		return { ammo }, REV_GetTotalRounds({ ammo })
	end

	local ammo_items = {}

	local slot_name = GetContainerInventorySlotName(unit)

	local ammo_class = ammo.class

	unit:ForEachItemInSlot(slot_name, ammo_class, function(item)
		if IsKindOf(item, ammo_class) then
			table.insert(ammo_items, item)
		end
	end, ammo_items)

	local bag = unit.Squad and GetSquadBag(unit.Squad)

	if bag then
		for _, item in ipairs(bag) do
			if IsKindOf(item, ammo_class) then
				table.insert(ammo_items, item)
			end
		end
	end

	return ammo_items, REV_GetTotalRounds(ammo_items)
end

function REV_MagReload(mag, ammo, suspend_fx, delayed_fx, use_more, orgAp, returnPrev)
	local unit = REV_GetOwner(mag.owner)

	local ap = orgAp

	local change = not mag.ammo or mag.ammo.class ~= ammo.class

	local prev_ammo = mag.ammo

	local ammo_items, total_rounds = REV_GetAmmoItems(unit, ammo, use_more)

	local combatMode = unit and InventoryIsCombatMode(unit) or false

	local addBullets, unloadBullets

	if not combatMode then
		addBullets = change and Min(mag.MagazineSize, total_rounds) or
			Min(mag.MagazineSize - (mag.ammo and mag.ammo.Amount or 0), total_rounds)

		unloadBullets = change and mag.ammo and mag.ammo.Amount or 0
	else
		ap, addBullets, unloadBullets = REV_GetMagReloadCosts(unit, mag, ammo, use_more, ap)

		if not orgAp then
			unit:ConsumeAP(ap, "Reload")
		end
	end

	if prev_ammo and not returnPrev then
		if prev_ammo.Amount == 0 then
			DoneObject(prev_ammo)
		else
			local bag = GetSquadBagInventory(unit.Squad)
			UnloadWeapon(mag, bag)
			-- no reload can be done if the aps are not enough to unload the mag
			-- local prev = unloadBullets < prev_ammo.Amount and PlaceInventoryItem(prev_ammo.class) or prev_ammo
			-- prev.Amount = Max(0, prev_ammo.Amount - unloadBullets)
			-- bag:AddAndStackItem(prev)
		end
	end

	if addBullets > 0 then
		if change then
			mag.ammo = PlaceInventoryItem(ammo.class)
			mag.ammo.Amount = 0
		end

		mag.ammo.Amount = mag.ammo.Amount + addBullets

		if not suspend_fx then
			CreateGameTimeThread(function(obj, delayed_fx)
				if delayed_fx then
					Sleep(InteractionRand(500, "ReloadDelay"))
				end
				if GetMercInventoryDlg() then
					PlayFX("WeaponLoad", "start", not obj.object_class and obj.weapon and obj.weapon.object_class,
						obj.class)
				else
					local vo = obj:GetVisualObj()
					local actor_class = vo.fx_actor_class
					vo.fx_actor_class = mag.class
					PlayFX("WeaponReload", "start", vo)
					vo.fx_actor_class = actor_class
				end
			end, mag, delayed_fx)
		end

		ObjModified(mag)

		for i, ammo in ipairs(ammo_items) do
			if ammo.Amount > addBullets then
				ammo.Amount = ammo.Amount - addBullets
				ObjModified(ammo)
				break
			end

			addBullets = addBullets - ammo.Amount

			DoneObject(ammo)

			if addBullets == 0 then
				break
			end
		end

		ObjModified("inventory tabs")
	end

	return prev_ammo, not suspend_fx, change
end

function REV_FindMagReloadTarget(item, ammo)
	if not IsKindOfClasses(ammo, "Ammo", "Ordnance") or not IsKindOf(item, "Mag") then
		return false
	end
	if item.Caliber == ammo.Caliber then
		return item
	end
end

function REV_IsMagReloadTarget(drag_item, target_item)
	local target = REV_FindMagReloadTarget(target_item, drag_item)
	return target and REV_IsMagAvailableForReload(target, { drag_item })
end

function REV_IsMagAvailableForReload(mag, ammoForWeapon)
	if not ammoForWeapon or not IsKindOf(mag, "Mag") then
		return false
	end
	local anyAmmo = 0 < #ammoForWeapon
	local fullMag = false
	if not mag.ammo then
		fullMag = false
	elseif mag.ammo.Amount == mag.MagazineSize then
		fullMag = true
	end

	if fullMag then
		if not anyAmmo then
			return false, AttackDisableReasons.FullClip
		else
			return true, AttackDisableReasons.FullClipHaveOther
		end
	elseif not anyAmmo then
		return false, AttackDisableReasons.NoAmmo
	end
	return true
end

function REV_GetAvailableAmmosForMags(unit, mag, ammo_type, unique)
	local ammo_class = "Ammo"
	local types = {}
	local containers = {}
	local slots = {}

	local slot_name = GetContainerInventorySlotName(unit)
	local caliber = mag.Caliber
	unit:ForEachItemInSlot(slot_name, ammo_class, function(ammo, slot_name, left, top, types, ammo_type, caliber, unique)
		if (not ammo_type or ammo.class == ammo_type) and
			ammo.Caliber == caliber and
			(not mag.ammo or mag.ammo.Amount < mag.MagazineSize or mag.ammo.class ~= ammo.class)
		then
			if not unique or not table.find(types, "class", ammo.class) then
				table.insert(types, ammo)
			end
		end
	end, types, ammo_type, caliber, unique)
	for i = 1, #types do
		containers[i] = unit
		slots[i] = slot_name
	end

	local bag = GetSquadBag(unit.Squad)
	for _, ammo in ipairs(bag) do
		if IsKindOf(ammo, ammo_class) and
			(not ammo_type or ammo.class == ammo_type) and
			ammo.Caliber == caliber and
			(not mag.ammo or mag.ammo.Amount < mag.MagazineSize or mag.ammo.class ~= ammo.class)
		then
			if not unique or not table.find(types, "class", ammo.class) then
				table.insert(types, ammo)
				table.insert(containers, bag)
			end
		end
	end

	return types, containers, slots
end

function REV_IsMagReloadEnabled(context)
	local unit = context.unit

	local combatMode = unit and InventoryIsCombatMode(unit) or false

	if not combatMode then
		return true
	end

	local unitAPleft = unit:GetUIActionPoints()

	if (unitAPleft < const.Scale.AP) then
		return false
	end

	local possibleOptions = REV_GetMagReloadOptions(context.item, unit, true)

	if #possibleOptions < 1 then
		return false
	end

	return true
end

function REV_GetMagReloadOptions(mag, unit, combat)
	local options = {}
	local errors = {}

	local availableAmmo = REV_GetAvailableAmmosForMags(unit, mag, nil, "unique")
	local available, err = REV_IsMagAvailableForReload(mag, availableAmmo)

	if available then
		for i, ammo in ipairs(availableAmmo) do
			if combat then
				local ap, addbullet, unload = REV_GetMagReloadCosts(unit, mag, ammo)
				if addbullet < 1 then
					goto continue
				end
			end

			options[#options + 1] = { weapon = mag, ammo = ammo }

			::continue::
		end
	else
		errors[mag] = err
	end
	return options, errors
end
