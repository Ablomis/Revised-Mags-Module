UndefineClass("Mag")
DefineClass.Mag = {
    __parents = {
      "InventoryItem"
    },
    properties = {
      {
        id = "Platform",
        category = "Caliber",
        template = true,
        default = 'AR15',
        editor = "Text",
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
          return {
            "44CAL",
            "545x39",
            "762x54R",
            "9mm",
            "50BMG",
            "556",
            "762WP",
            "762NATO",
            "12gauge"
          }
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
      }
    },
    ammo = false,
}

function FirearmBase:GetSpecialScrapItems() 
  local special_components = {} 
  if self.Magazine then 
    g_Units[self.owner]:AddItem("Inventory", PlaceInventoryItem(self.Magazine)) 
  end 
  for _, component in sorted_pairs(self.components or empty_table) do 
    local comp = WeaponComponents[component] 
    if comp then 
      for _, costs in ipairs(comp.AdditionalCosts) do 
        local idx = table.find(special_components, "restype", costs.Type) 
        if idx then 
          special_components[idx].amount = (special_components[idx].amount or 0) + costs.Amount 
        else 
          table.insert(special_components, { 
            restype = costs.Type, 
            amount = costs.Amount 
          }) 
        end 
      end 
    end 
  end 
  return special_components 
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
