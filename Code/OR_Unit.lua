local REV_OriginalUnitReloadAction = Unit.ReloadAction

function Unit:ReloadAction(action_id, cost_ap, args)
	if not args.reload_all and args.mode == "MagMode" then
		local mag = REV_GetMagById(self, args.ammo_id)
		local weapon = args and args.weapon
		if type(weapon) == "number" then
			local w1, w2, wl = self:GetActiveWeapons()
			weapon = wl[weapon]
		else
			weapon = self:GetWeaponByDefIdOrDefault("Firearm", weapon, args and args.pos, args and args.item_id)
		end
		REV_MagReloadWeapon(self, weapon, mag, args and args.delayed_fx)
		return
	elseif args.mode == "MagReloadMode" then
		local mag = g_ItemIdToItem[args.item_id]
		local ammo = g_ItemIdToItem[args.ammo_id]
		assert(mag)
		REV_MagReload(mag, ammo, nil, nil, "use_more", cost_ap)
		return
	else
		return REV_OriginalUnitReloadAction(self, action_id, cost_ap, args)
	end
end


local REV_Original_InvetoryAction_RealoadWeapon = NetSyncEvents.InvetoryAction_RealoadWeapon

function NetSyncEvents.InvetoryAction_RealoadWeapon(session_id, ap, args, src_ammo_type)
	if args.mode == "MagReloadMode" then
		local combat_mode = g_Units[session_id] and InventoryIsCombatMode(g_Units[session_id])
		local unit = (not gv_SatelliteView or combat_mode) and g_Units[session_id] or gv_UnitData[session_id]
		if combat_mode and gv_SatelliteView then
			unit:SyncWithSession("session")
		end
		local mag = g_ItemIdToItem[args.item_id]
		local ammo = g_ItemIdToItem[args.ammo_id]
		REV_MagReload(mag, ammo, nil, nil, nil, "use_more")
		if combat_mode and gv_SatelliteView then
			unit:SyncWithSession("map")
		end
		if unit:CanBeControlled() then InventoryUpdate(unit) end
	elseif args.mode == "MagMode" then
		local combat_mode = g_Units[session_id] and InventoryIsCombatMode(g_Units[session_id])
		local unit = (not gv_SatelliteView or combat_mode) and g_Units[session_id] or gv_UnitData[session_id]
		if combat_mode and gv_SatelliteView then
			unit:SyncWithSession("session")
		end
		if combat_mode and ap > 0 and unit:UIHasAP(ap) then
			assert(IsKindOf(unit, "Unit"), "Consume AP called for UnitData")
			unit:ConsumeAP(ap, "Reload")
		end
		local ammo = REV_GetMagById(unit, args.ammo_id)
		local weapon = g_ItemIdToItem[args.item_id]
		assert(weapon)
		REV_MagReloadWeapon(unit, weapon, ammo)
		if combat_mode and gv_SatelliteView then
			unit:SyncWithSession("map")
		end
		if unit:CanBeControlled() then InventoryUpdate(unit) end
	else
		return REV_Original_InvetoryAction_RealoadWeapon(session_id, ap, args, src_ammo_type)
	end
end