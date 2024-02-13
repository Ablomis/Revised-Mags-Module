-- local REV_Original_StartCombatAction = StartCombatAction

-- function StartCombatAction(action_id, unit, ap, ...)
-- 	if g_Combat and action_id == "MoveItems" and unit and unit.action_command == "ReloadAction" then
-- 		if g_ItemNetEvents[action_id] then
-- 			CancelUnitWaitingActions(unit)
-- 		end
-- 		table.insert(CombatActions_Waiting, pack_params(action_id, unit, ap, ...))
-- 		RunCombatActions()
-- 	else
-- 		REV_Original_StartCombatAction(action_id, unit, ap, ...)
-- 	end
-- end

local REV_Original_FindWeaponReloadTarget = FindWeaponReloadTarget

function FindWeaponReloadTarget(item, ammo)
	if IsKindOf(ammo, "Mag") and item.Platform == ammo.Platform and item.Caliber == ammo.Caliber then
		return item
	end

	if IsKindOf(item, "Mag") then
		return item
	end

	return REV_Original_FindWeaponReloadTarget(item, ammo)
end

local REV_Original_IsWeaponAvailableForReload = IsWeaponAvailableForReload

function IsWeaponAvailableForReload(weapon, ammoForWeapon)
	if ammoForWeapon and IsKindOf(weapon, "Firearm") and IsKindOf(ammoForWeapon[1], "Mag") then
		return true
	end

	return REV_Original_IsWeaponAvailableForReload(weapon, ammoForWeapon)
end

local REV_Original_GetInventoryItemDragDropFXActor = GetInventoryItemDragDropFXActor

function GetInventoryItemDragDropFXActor(item)
	if IsKindOf(item, "Mag") then
		return item.Caliber
	end

	return REV_Original_GetInventoryItemDragDropFXActor(item)
end

local REV_Original_XInventoryItemOnContextUpdate = XInventoryItem.OnContextUpdate

function XInventoryItem:OnContextUpdate(item, ...)
	REV_Original_XInventoryItemOnContextUpdate(self, item, ...)

	if IsKindOf(item, "Mag") then
		local colorStyle = 'AmmoBasicColor'
		local amount = 0
		if not item.ammo == false then
			if item.ammo.colorStyle then
				colorStyle = item.ammo.colorStyle
			end
			amount = item.ammo.Amount
		end

		local text = Untranslated('<color ' ..
			colorStyle .. '>' .. amount .. '/<style InventoryItemsCountMax>' .. item.MagazineSize .. '</style></color>')
		self.idTopRightText:SetText(text)
	end
end

local REV_Original_QuickReloadButton = QuickReloadButton

function QuickReloadButton(parent, weapon, delayed_fx)
	local unit = SelectedObj

	local mag = REV_GetBestMagForWeapon(unit, weapon, { notEmpty = true, sameType = true })

	if mag then
		local wep = weapon or parent:ResolveId("node"):ResolveId("node").context
		local _, __, wl = unit:GetActiveWeapons()
		local idx = table.find(wl, wep)

		CombatActions.Reload:Execute({ unit },
			{
				weapon = idx,
				target = mag.ammo.class,
				mode = "MagMode",
				ammo_id = mag.id,
				delayed_fx = delayed_fx,
				item_id = weapon and weapon.id
			})
		return true
	end

	return REV_Original_QuickReloadButton(parent, weapon, delayed_fx)
end

local REV_Original_GetReloadOptionsForWeapon = GetReloadOptionsForWeapon

function GetReloadOptionsForWeapon(weapon, unit, skipSubWeapon, includeEmpty)
	if not unit and #Selection == 0 then return {} end
	unit = unit or Selection[1]
	local combatMode = InventoryIsCombatMode(unit)

	if IsKindOf(weapon, "Mag") then
		return REV_GetMagReloadOptions(weapon, unit, combatMode)
	end

	local options, errors = REV_Original_GetReloadOptionsForWeapon(weapon, unit, skipSubWeapon)

	if not weapon.Magazine then
		return options, errors
	end

	local magOptions = REV_GetMagReloadOptionsForWeapon(weapon, unit, includeEmpty, combatMode)

	if combatMode then
		return magOptions
	end

	if magOptions then
		for _, v in ipairs(magOptions) do
			table.insert(options, 1, v)
		end
	end

	return options, errors
end
