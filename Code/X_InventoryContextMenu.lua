function OnMsg.DataLoaded()
	local weaponGroup = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(XTemplates.InventoryContextMenu, 'comment',
		'weapon')

	if weaponGroup and weaponGroup.element then
		local OriginalCondition = weaponGroup.element.__condition

		weaponGroup.element.__condition = function(parent, context)
			if IsKindOf(context.item, "Mag") then
				return true
			else
				return OriginalCondition(parent, context)
			end
		end
	end

	local modifyTemplate = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(XTemplates.InventoryContextMenu, 'Id',
		'modify')

	if modifyTemplate and modifyTemplate.element then
		local OriginalOnContextUpdate = modifyTemplate.element.OnContextUpdate

		modifyTemplate.element.OnContextUpdate = function(self, context, ...)
			local obj = context.item
			if IsKindOf(obj, "Mag") then
				self:SetEnabled(false)
			else
				OriginalOnContextUpdate(self, context, ...)
			end
		end
	end

	local reloadTemplate = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(XTemplates.InventoryContextMenu, 'Id',
		'reload')

	if reloadTemplate and reloadTemplate.element then
		local OriginalOnContextUpdate = reloadTemplate.element.OnContextUpdate

		reloadTemplate.element.OnContextUpdate = function(self, context, ...)
			if IsKindOf(context.item, "Mag") then
				self:SetEnabled(REV_IsMagReloadEnabled(context))
			elseif not context.item.Magazine then
				return OriginalOnContextUpdate(self, context, ...)
			else
				if REV_IsReloadWithMagEnabled(context) then
					self:SetEnabled(true)
					return
				elseif InventoryIsCombatMode(context.unit) then
					self:SetEnabled(false)
					return
				end

				OriginalOnContextUpdate(self, context, ...)
			end
		end

		reloadTemplate.element[1].__condition = function(parent, context)
			return false
		end
	end

	local unloadTemplate = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(XTemplates.InventoryContextMenu, 'Id',
		'unload')

	if unloadTemplate and unloadTemplate.element then
		unloadTemplate.element.OnContextUpdate = function(self, context, ...)
			local item = context.item
			local unit = context.unit
			local ap = REV_GetMagUnloadCosts(unit, item)
			if not item.ammo or item.ammo.Amount == 0 or not unit:UIHasAP(ap) then
				self:SetEnabled(false)
			else
				self:SetEnabled(true)
			end
		end

		unloadTemplate.element.OnPress = function(self, gamepad)
			local context = self:ResolveId("node").context
			if not context then return end
			local item = context.item
			local unit = context.unit
			local container = context.context
			local slot_name = context.slot_wnd.slot_name
			if not item.ammo then
				return
			end
			local cost_ap = InventoryIsCombatMode() and REV_GetMagUnloadCosts(unit, item) or 0
			if InventoryIsCombatMode() and not unit:UIHasAP(cost_ap) then
				PlayFX("ReloadFail", "start", item)
				return
			end
			NetSquadBagAction(unit, container, slot_name, item, gv_SquadBag, "unload", cost_ap)
			PlayFX("WeaponUnload", "start", item.object_class, item.class)
			context.slot_wnd:ClosePopup()
		end

		unloadTemplate.element[1][2].func = function(self, rollover)
			local context = self.context
			local item = context.item
			local unit = context.unit
			local cost_ap = REV_GetMagUnloadCosts(unit, item) or 0

			self:SetTextStyle((rollover and self.enabled) and "SatelliteContextMenuTextRollover" or
				"SatelliteContextMenuText")
			if cost_ap > 0 then
				local text = "<ap(cost_ap)>"
				if not context.unit:UIHasAP(cost_ap) then
					text = "<color InventoryActionsTextRed>" .. text .. "</color>"
				end
				self:SetText(T { text, cost_ap = cost_ap })
			end
		end
	end

	local equipTemplate = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(XTemplates.InventoryContextMenu, 'Id',
		"equip")

	if equipTemplate and equipTemplate.element then
		local OriginalCondition = equipTemplate.element.__condition

		equipTemplate.element.__condition = function(parent, context)
			if IsKindOf(context.item, "Mag") then
				return false
			else
				return OriginalCondition(parent, context)
			end
		end
	end
end
