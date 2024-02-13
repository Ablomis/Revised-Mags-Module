function OnMsg.ModsReloaded()
	CombatActions.Reload.GetAPCost = function(self, unit, args)
		if unit:HasStatusEffect("ManningEmplacement") then return -1 end
		local weapon
		if args and args.item_id then
			local alt_set = (unit.current_weapon == "Handheld A") and "Handheld B" or "Handheld A"
			weapon =
				unit:FindWeaponInSlotById(unit.current_weapon, args.item_id) or
				unit:FindWeaponInSlotById(alt_set, args.item_id) or
				unit:FindWeaponInSlotById("Inventory", args.item_id)
		end
		if not weapon then
			if args and args.pos then
				weapon = unit:GetItemAtPackedPos(args.pos)
			else
				weapon = unit:GetWeaponByDefIdOrDefault("Firearm", args and args.weapon)
			end
		end

		if not args then
			return -1
		end

		local item = args.item or args.ammo_id and g_ItemIdToItem[args.ammo_id]

        local aps = REV_GetReloadAP(unit, weapon, item, args.mode)

		return (weapon and not weapon.jammed) and aps or -1
	end
end
