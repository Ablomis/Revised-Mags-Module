function OnMsg.DataLoaded()
	local weaponComponentWindowButton = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(
		XTemplates.WeaponComponentWindow, 'Id', 'idCurrent')

	if weaponComponentWindowButton and weaponComponentWindowButton.element then
		local OriginalOnContextUpdate = weaponComponentWindowButton.element.OnContextUpdate

		weaponComponentWindowButton.element.OnContextUpdate = function(self, context, ...)
			OriginalOnContextUpdate(self, context, ...)
			if context.slot and context.slot.SlotType == "Magazine" then
				self:SetEnabled(false)
			end
		end
	end
end
