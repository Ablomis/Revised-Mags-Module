function HighlightWeaponsForAmmo(ammo, bShow)
	local dlg = GetMercInventoryDlg()
	if not dlg or not ammo then
		return 
	end
	if dlg.compare_mode then
		bShow = false
	end	
	-- squad bag	
	local h_members = {}	
	local is_bag_item = ammo:IsKindOf("SquadBagItem")
	if is_bag_item then
		local bag = gv_SquadBag
		h_members[bag] = true
	end
	-------------------
	-- custom code
	local is_ammo = IsKindOf(ammo, "Ammo") or IsKindOf(ammo, "Mag")
	-- custom code end
	-------------------
	local is_ordnance = IsKindOf(ammo,"Ordnance")
	if not (is_ammo or is_ordnance) and not is_bag_item then
		return
	end	
	local weapon_class = is_ammo and "Firearm" or "HeavyWeapon"
	-- Highlight portraits
	local left = dlg:ResolveId("idPartyContainer")						
	local squad_list = left.idParty and left.idParty.idContainer or empty_table
	for _, button in ipairs(squad_list) do	
		local member = button:GetContext()
		if (is_ammo or is_ordnance) and member then
			for _, slot_data in ipairs(member.inventory_slots) do
				local slot_name = slot_data.slot_name
				if IsEquipSlot(slot_name) then
					local result = member:ForEachItemInSlot(slot_name, weapon_class, function(witem, slot, left, top, caliber)
						if witem.Caliber == caliber then
							return "break"
						end
					end, ammo.Caliber)
					if result == "break" then
						-- head
						button:SetHighlightedStatOrIcon(bShow and "UI/Icons/Rollover/ammo")
						-- backpack
						h_members[member] = true
					end
				end
			end
		end
		--Highlight weapons
		local all_slots = dlg:GetSlotsArray()
		for slot_wnd in pairs(all_slots) do
			local slot_name = slot_wnd.slot_name
			local target = slot_wnd:GetContext()
			local found =  false
			for wnd, witem in pairs(slot_wnd.item_windows or empty_table) do
				if (is_ammo or is_ordnance) and IsKindOf(witem,weapon_class) and ammo.Caliber == witem.Caliber then
					wnd:OnSetRollover(bShow)
					HighlihgtRollover(witem:GetUIWidth() ,wnd, bShow)
					found =  true
				end
			end
			if not IsKindOf(target, "SquadBag") and slot_wnd and not IsEquipSlot(slot_name) and (IsKindOf(target, "Unit") and not target:IsDead()) and (found or not bShow or h_members[target]) then
				local name = slot_wnd.parent.idName
				name:SetHightlighted(bShow)
			end
		end	

		if not bShow then
			button:SetHighlighted(bShow)
		end	
	end
end
