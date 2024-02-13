function OnMsg.DataLoaded()
	local rolloverInventoryBaseContent = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(
		XTemplates.RolloverInventoryBase, 'Id', 'idContent')

	if rolloverInventoryBaseContent and rolloverInventoryBaseContent.element then
		local OriginalOnContextUpdate = rolloverInventoryBaseContent.element.OnContextUpdate


		rolloverInventoryBaseContent.element.OnContextUpdate = function(self, context, ...)
			OriginalOnContextUpdate(self, context, ...)
			if context and context[1] and IsKindOf(context[1], "Mag") then
				local mag = context[1]

				if mag.ammo then
					self.idItemHint:SetText(T { 571030717647, "<name>", name = mag.ammo.DisplayName })
				else
					self.idItemHint:SetText(T { 106798463585, "Empty <name>", name = mag.AdditionalHint })
				end
			end
		end
	end
end