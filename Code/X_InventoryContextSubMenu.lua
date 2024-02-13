function OnMsg.DataLoaded()
	local contextSubMenuReloadOptions = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(
		XTemplates.InventoryContextSubMenu, 'comment', 'ammo (reload action)')

	if contextSubMenuReloadOptions and contextSubMenuReloadOptions.element then
		contextSubMenuReloadOptions.element.array = function(parent, context)
			return REV_GetSubMenuReloadOptions(context)
		end

		local OriginalRunAfter = contextSubMenuReloadOptions.element.run_after

		contextSubMenuReloadOptions.element.run_after = function(child, context, item, i, n, last)
			if IsKindOf(item.weapon, "Mag") then
				child:SetContext(item)
				local count = context.unit:CountAvailableAmmo(item.ammo.class)
				local apCosts = false
				local unload = 0

				if context.unit and InventoryIsCombatMode(context.unit) then
					apCosts, count, unload = REV_GetMagReloadCosts(context.unit, item.weapon, item.ammo, "use_more")
				end

				child:SetText(T({
					433225540474,
					"<ammo_type> (<count>)<ap>",
					ammo_type = item.ammo.DisplayName,
					count = count,
					ap = apCosts and " " .. T(1209389089027890, "AP: ") .. apCosts or ""
				}))
				child:SetFocusOrder(point(2, i))
				if not REV_IsMagAvailableForReload(item.weapon, {
						item.ammo
					}) then
					child:SetEnabled(false)
				end
			elseif IsKindOf(item.ammo, "Mag") then
				child:SetContext(item)
				if not item.ammo.ammo then
					child:SetText(T({
						4332255404740816,
						"empty <mag_name> (max. <size>)",
						mag_name = item.ammo.DisplayName,
						size = item.ammo.MagazineSize
					}))
				else
					local count = item.ammo.ammo.Amount
					child:SetText(T({
						433225540474,
						"<ammo_type>(<count>) <mag_name> (max. <size>)",
						ammo_type = item.ammo.ammo and item.ammo.ammo.DisplayName,
						count = count,
						mag_name = item.ammo.DisplayName,
						size = item.ammo.MagazineSize						
					}))
				end
				child:SetFocusOrder(point(2, i))
			else
				OriginalRunAfter(child, context, item, i, n, last)
			end
		end
	end

	local reloadTemplate = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(
		XTemplates.InventoryContextSubMenu, 'comment', 'reload')

	if reloadTemplate and reloadTemplate.element then
		reloadTemplate.element.OnPress = function(self, gamepad)
			local ammo = self.context.ammo
			local weapon = self.context.weapon
			local context = self:ResolveId("node"):GetContext()
			local container = context.context
			local unit = context.unit
			local pos
			pos = container and container:GetItemPackedPos(weapon)
			local actionArgs
			if IsKindOf(ammo, "Mag") then
				actionArgs = {
					target = ammo.ammo and ammo.ammo.class or nil,
					pos = pos,
					item_id = weapon.id,
					mode = "MagMode",
					ammo_id = ammo.id
				}
			elseif IsKindOf(weapon, "Mag") then
				actionArgs = {
					target = ammo.class,
					pos = pos,
					item_id = weapon.id,
					mode = "MagReloadMode",
					ammo_id = ammo.id
				}
			else
				actionArgs = {
					target = ammo.class,
					pos = pos,
					item_id = weapon.id,
					mode = "AmmoMode",
					ammo_id = false
				}
			end
			local ap = CombatActions.Reload:GetAPCost(unit, actionArgs)
			ap = InventoryIsCombatMode(unit) and ap or 0
			if IsKindOf(unit, "Unit") then
				NetStartCombatAction("Reload", unit, ap, actionArgs)
			elseif IsKindOf(unit, "UnitData") then
				NetSyncEvent("InvetoryAction_RealoadWeapon", unit.session_id, ap, actionArgs, ammo.class)
			end
			if context.slot_wnd then
				context.slot_wnd:ClosePopup()
			else
				local popup = self:ResolveId("node"):ResolveId("node")
				popup:Close()
			end
			ObjModified(unit)
			InventoryUpdate(unit)
		end
	end
end
