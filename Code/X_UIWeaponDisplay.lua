function OnMsg.DataLoaded()
	local reloadButton = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(
		XTemplates.UIWeaponDisplay, 'Id', 'idReloadButton')

	if reloadButton and reloadButton.element then
		reloadButton.element.OnContextUpdate = function(self, context, ...)
			local weaponContainer = self:ResolveId("node")
			local unitContainer = weaponContainer:ResolveId("node")
			local unit = unitContainer.context
			local weapon = weaponContainer.context
			local wepIdx, ammo = GetQuickReloadWeaponAndAmmo(self, weapon)
			local bullets = GetBulletCount(weapon)
			local full = bullets == weapon.MagazineSize
			local canReload = not full and wepIdx
			local enabled = canReload and CombatActions.Reload:GetVisibility({ unit }) == "enabled"
			-- TODO: Check if there is alternative ammo available and remove unused checks
			self:SetEnabled(true)
			self:ResolveId("node").context.item = weapon
			self:ResolveId("node").context.unit = unit
			self:SetGridY(#self.parent + 1) -- Last
		end

		reloadButton.element.OnPress = function(self, gamepad)
			SpawnWeaponUiReloadPopup(self, "reload")
		end

		reloadButton.element[3].func = nil
		reloadButton.element[4].func = nil
		reloadButton.element[5].func = nil
	end

	local subReloadButton = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(
		XTemplates.UIWeaponDisplay, 'Id', 'idSubReloadButton')

	if subReloadButton and subReloadButton.element then
		subReloadButton.element.OnContextUpdate = function(self, context, ...)
			local weapon = self:ResolveId("node").context
			local wepIdx, ammo = GetQuickReloadWeaponAndAmmo(self, weapon)
			local bullets = GetBulletCount(weapon)
			local item = weapon
			while item.parent_weapon do
				item = item.parent_weapon
			end
			local units = Selection
			if item and item.owner then
				local owner = g_Units[item.owner]
				if owner then
					units = { owner }
				end
			end
			local full = bullets == weapon.MagazineSize
			local canReload = not full and wepIdx
			local enabled = canReload and CombatActions.Reload:GetVisibility(units) == "enabled"
			-- TODO: Check if there is alternative ammo available and remove unused checks
			self:SetEnabled(true)
			self:ResolveId("node").context.item = weapon
			self:ResolveId("node").context.unit = units[1]
		end

		subReloadButton.element.OnPress = function(self, gamepad)
			SpawnWeaponUiReloadPopup(self, "reload")
		end

		subReloadButton.element[3].func = nil
		subReloadButton.element[4].func = nil
		subReloadButton.element[5].func = nil
	end
end

function SpawnWeaponUiReloadPopup(actionButton, action)
	local node = actionButton:ResolveId("node")
	local context = node.context
	context.action = action
	if node.spawned_popup then
		node.spawned_popup:Close()
		node.spawned_popup = nil	
		return
	end
	local popup = XTemplateSpawn("InventoryContextSubMenu", terminal.desktop, context)
	popup:SetAnchorType("right")
	popup:SetAnchor(actionButton.box)
	popup.popup_parent = node
	node.spawned_popup = popup
	popup:Open()
end