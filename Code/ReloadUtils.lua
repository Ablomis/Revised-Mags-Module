function REV_GetReloadAP(unit, weapon, ammo, mode)
	if not IsKindOf(weapon, "Mag") and not weapon.Magazine then
		return weapon.ReloadAP
	end

	local combat_mode = g_Units[unit.session_id] and InventoryIsCombatMode(g_Units[unit.session_id])

	unit = (not gv_SatelliteView or combat_mode) and g_Units[unit.session_id] or gv_UnitData[unit.session_id]

	if IsKindOf(ammo, "Mag") or mode == "MagMode" then
		return weapon.ReloadAP + ammo.ExtraAPCosts
	end

	if not IsKindOf(weapon, "Mag") then
		weapon = weapon.magazine
	end

	-- todo differentiate between drag and context menu

	return REV_GetMagReloadCosts(unit, weapon, ammo)
end

function REV_GetOwner(sessionId)
	local combat_mode = g_Units[sessionId] and InventoryIsCombatMode(g_Units[sessionId])

	return (not gv_SatelliteView or combat_mode) and g_Units[sessionId] or gv_UnitData[sessionId]
end

function REV_GetSubMenuReloadOptions(context)
	local options = GetReloadOptionsForWeapon(context.item, context.unit, "skipSubWeapon", true)
	return context.action == "reload" and options or {}
end