local REV_Original_IsReload = IsReload

function IsReload(ammo, weapon)

	if not ammo or not weapon then return false end

	local unit = REV_GetOwner(ammo.owner) or REV_GetOwner(weapon.owner)

	if unit and InventoryIsCombatMode(unit) and IsKindOf(weapon, "Weapon") and IsKindOf(ammo, "Ammo") then return false end

	if IsKindOf(weapon, "Mag") and IsKindOf(ammo, "Mag") then return false end

	if IsKindOf(weapon, "Weapon") and IsKindOf(ammo, "Mag") then return true end

	if IsKindOf(weapon, "Mag") and IsKindOf(ammo, "Ammo") then return true end

	return REV_Original_IsReload(ammo, weapon)
end

local REV_Original_GetAPCostAndUnit = GetAPCostAndUnit

function GetAPCostAndUnit(item, src_container, src_container_slot_name, dest_container, dest_container_slot_name, item_at_dest, is_reload)
	if is_reload then
		local dest_unit = dest_container
		if IsKindOf(dest_unit, "UnitData") then
			dest_unit = g_Units[dest_unit.session_id]
		end
		local inv_unit = GetInventoryUnit()
		local unit = IsKindOf(dest_unit, "Unit") and not dest_unit:IsDead() and dest_unit or inv_unit --user can be reloading in container, hence dest_unit can be a container
		local action = CombatActions["Reload"]
		local pos = dest_container:GetItemPackedPos(item_at_dest)
		local ap = 0 --IsKindOf(item, 'Ammo') and not IsKindOf(item_at_dest, 'Mag') and 100000000000000 or 0 --action:GetAPCost(unit, { weapon = item_at_dest.class, pos = pos, item = item }) or 0
		local action_name = T(160472488023, "Reload")
		return ap, unit, action_name
	else
		return REV_Original_GetAPCostAndUnit(item, src_container, src_container_slot_name, dest_container, dest_container_slot_name, item_at_dest, is_reload)
	end
end