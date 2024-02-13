local REV_OriginalGetSpecialScrapItems = FirearmBase.GetSpecialScrapItems

function FirearmBase:GetSpecialScrapItems()
	if self.Magazine then
		local unit

		if self.owner then
			unit = REV_GetOwner(self.owner)
		end

		local container = unit or GetSectorInventory(gv_CurrentSectorId)

		if container then
			container:AddItem("Inventory", self.magazine or PlaceInventoryItem(self.Magazine))
		end
	end

	return REV_OriginalGetSpecialScrapItems(self)
end

local REV_OriginalFireamBaseInit = FirearmBase.Init

function FirearmBase:Init()
	REV_OriginalFireamBaseInit(self)

	local magazine = self.Magazine or
		REV_GetMagazineClassByPlatformAndModification(self.Platform, self.components.Magazine or 'MagNormal', true)

	if magazine then
		self.magazine = PlaceInventoryItem(magazine)
		self.ammo = self.magazine.ammo
	end
end

local REV_Original_FirearmReload = Firearm.Reload

function Firearm:Reload(mag, suspend_fx, delayed_fx)
	if IsKindOf(mag, "Mag") then
		-- local prev_ammo = self.ammo
		local change
		local prev_ammo = self.ammo
		local prev_mag = self.magazine
		prev_mag.ammo = prev_ammo
		local modification = mag.Modification or "MagNormal"

		self.ammo = mag.ammo
		self.magazine = mag

		self:SetWeaponComponent("Magazine", modification)

		self:RemoveModifiers("ammo")
		if (self.ammo) then
			for _, mod in ipairs(self.ammo.Modifications) do
				self:AddModifier("ammo", mod.target_prop, mod.mod_mul, mod.mod_add)
			end
		end

		local owner = mag.owner and REV_GetOwner(mag.owner) or GetSectorInventory(gv_CurrentSectorId)

		if owner then
			owner:RemoveItem("Inventory", mag)
			owner:AddItem("Inventory", prev_mag)
		end

		ObjModified(self)
		ObjModified(owner)
		ObjModified(mag)
		ObjModified(prev_mag)
		return false, false, change
	else
		return REV_Original_FirearmReload(self, mag, suspend_fx, delayed_fx)
	end
end

function Firearm:SetMagazineComponents(id, is_init)
	local slot = "Magazine"
	local def = WeaponComponents[id]

	self:UnregisterReactions()

	-- Remove old component
	if (self.components[slot] or "") ~= "" then
		local component = self.components[slot]
		local componentPreset = WeaponComponents[component]
		self:RemoveModifiers(component)
		if componentPreset then
			for i, v in ipairs(componentPreset.Visuals) do
				if v:Match(self.class) then
					local slotId = v.Slot
					local componentSlot = table.find_value(self.ComponentSlots, "SlotType", slotId)
					self.components[slotId] = componentSlot and componentSlot.DefaultComponent or ""
				end
			end
		end
	end

	self.components[slot] = id or ""
	self:RegisterReactions()
	self.visual_obj_dirty = true

	-- Attach new component if any
	if def then
		local magazine = self.magazine 
		
		if not magazine then
			local magazineId = g_Classes[self.class].Magazine

			magazine = g_Classes[magazineId]
		end
		
		if magazine then
			self:AddModifier(id, "MagazineSize", 1000, magazine.MagazineSize)
		end

	end

	self:UpdateVisualObj()

	ObjModified(self)
end

local REV_Original_FirearmBaseSetWeaponComponent = FirearmBase.SetWeaponComponent

function FirearmBase:SetWeaponComponent(slot, id, is_init)
	if slot == "Magazine" then
		self:SetMagazineComponents(id, is_init)
	else
		REV_Original_FirearmBaseSetWeaponComponent(self, slot, id, is_init)
	end
end
