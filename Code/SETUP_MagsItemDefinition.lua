UndefineClass("Mag")
DefineClass.Mag = {
	__parents = {
		"InventoryItem",
		"BobbyRayShopAmmoProperties"
	},
	properties = {
		{
			id = "Platform",
			category = "Caliber",
			template = true,
			default = 'AR15',
			editor = "text",
		},
		{
			category = "Caliber",
			id = "MagazineSize",
			name = "Magazine Size",
			help = "Number of bullets in a single clip",
			editor = "number",
			default = 30,
			template = true,
			min = 1,
			max = 500,
			modifiable = true
		},
		{
			category = "Caliber",
			id = "Caliber",
			editor = "combo",
			default = false,
			template = true,
			modifiable = true,
			items = function(self)
				local presetsCalibers = Presets.Caliber.Default

				local caliberIds = {}

				for k, presetCaliber in ipairs(presetsCalibers) do
					if type(presetCaliber) == "table" then
						table.insert(caliberIds, presetCaliber.id)
					end
				end

				return caliberIds
			end
		},
		{
			category = "Caliber",
			id = "Modification",
			editor = "combo",
			default = "false",
			template = true,
			modifiable = true,
			items = function(self)
				local presetsClips = Presets.WeaponComponentSharedClass.Clip

				local presetClipIds = {}

				for id, presetClip in ipairs(presetsClips) do
					if type(presetClip) == "table" then
						table.insert(presetClipIds, presetClip.id)
					end
				end

				return presetClipIds
			end
		},
		{
			category = "Caliber",
			id = "Type",
			editor = "combo",
			default = false,
			template = true,
			modifiable = true,
			items = function(self)
				return {
					"Rifle",
					"Pistol",
					"Large"
				}
			end
		},
		{
			category = "Caliber",
			id = "ExtraAPCosts",
			name = "Extra Reload AP",
			help = "Adds to the base AP cost for reloading",
			editor = "number",
			default = 0,
			template = true,
			min = 0,
			max = 500000,
			modifiable = true,
			scale = "AP"
		},
		{
			category = "Caliber",
			id = "MagReloadCosts",
			name = "Mag Reload AP",
			help = "How much AP it costs to reload the magazine",
			editor = "number",
			default = 10000,
			template = true,
			min = 0,
			max = 500000,
			modifiable = true,
			scale = "AP"
		},
		{
			category = "Caliber",
			id = "MagUnloadCosts",
			name = "Mag Unload AP",
			help = "How much AP it costs to reload the magazine",
			editor = "number",
			default = 5000,
			template = true,
			min = 0,
			max = 500000,
			modifiable = true,
			scale = "AP"
		},
		{
			category = "Default",
			id = "Weight",
			name = "Empty magazine weight",
			help = "Weight of the magazine in grams without bulletes",
			editor = "number",
			default = 100,
			template = true,
			min = 0,
			max = 500000,
			modifiable = true,
		},
	},
	ammo = false,
}


function Mag:Init()
	self.ammo = false
end

function Mag:Reload(ammo, suspend_fx, delayed_fx)
	
	return REV_MagReload(self, ammo, suspend_fx, delayed_fx, nil, nil, "returnPrev")

	-- ObjModified(self)
	-- return prev_ammo, not suspend_fx, change
end

function Mag:GetVisualObj()
	return nil
end



function Mag:__toluacode(indent, pstr, GetPropFunc)
	return self:SaveToLuaCode(indent, pstr, GetPropFunc)
end

function Mag:SaveToLuaCode(indent, pStr, GetPropFunc, pos)
	if not pStr then
		local additional
		if self.ammo then
			local ammo_props = self.ammo:SavePropsToLuaCode(indent, GetPropFunc)
			ammo_props = ammo_props or "nil"
			additional = string.format([[

	 'ammo',PlaceInventoryItem('%s', %s)]], self.ammo.class, ammo_props)
		end
		local props = self:SavePropsToLuaCode(indent, GetPropFunc, pStr, additional)
		props = props or "nil"
		if pos then
			return string.format("%d, PlaceInventoryItem('%s', %s)", pos, self.class, props)
		else
			return string.format("PlaceInventoryItem('%s', %s)", self.class, props)
		end
	else
		local additional = pstr("", 1024)
		if self.ammo then
			additional:appendf([[

	 'ammo',PlaceInventoryItem('%s', ]], self.ammo.class)
			if not self.ammo:SavePropsToLuaCode(indent, GetPropFunc, additional) then
				additional:append("nil")
			end
			additional:append("),")
		end
		if pos then
			pStr:append(tostring(pos) .. ", ")
			pStr:appendf("PlaceInventoryItem('%s', ", self.class)
			if not self:SavePropsToLuaCode(indent, GetPropFunc, pStr, additional) then
				pStr:append("nil")
			end
			return pStr:append(") ")
		else
			pStr:appendf("PlaceInventoryItem('%s', ", self.class)
			if not self:SavePropsToLuaCode(indent, GetPropFunc, pStr, additional) then
				pStr:append("nil")
			end
			return pStr:append(") ")
		end
	end
end
