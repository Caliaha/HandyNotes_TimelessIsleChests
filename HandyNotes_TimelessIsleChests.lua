TimelessIsleChest = LibStub("AceAddon-3.0"):NewAddon("TimelessIsleChest", "AceConsole-3.0", "AceEvent-3.0")

local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes", true)
if not HandyNotes then return end

local module = TimelessIsleChest:NewModule("HandyNotes", "AceEvent-3.0")
local db
local icon = "Interface\\Icons\\TRADE_ARCHAEOLOGY_CHESTOFTINYGLASSANIMALS"

local nodes = { }
module.nodes = nodes

-- Coords Start
local chests = { }
chests[33170] = 36703410
chests[33171] = 25502720
chests[33172] = 27403910
chests[33173] = 30703650
chests[33174] = 22403540
chests[33175] = 22104930
chests[33176] = 24805300
chests[33177] = 25704580
chests[33178] = 22306810
chests[33179] = 26806870
chests[33180] = 31007630
chests[33181] = 35307640
chests[33182] = 38707160
chests[33183] = 39807950
chests[33184] = 34808420
chests[33185] = 43608410
chests[33186] = 47005370
chests[33187] = 46704670
chests[33188] = 51204570
chests[33189] = 55504430
chests[33190] = 58005070
chests[33191] = 65704780
chests[33192] = 63805920
chests[33193] = 64907560
chests[33194] = 60206600
chests[33195] = 49706570
chests[33196] = 53107080
chests[33197] = 52706270
chests[33227] = 61708850
chests[33198] = 44206530
chests[33199] = 26006140
chests[33200] = 24603850
chests[33202] = 29703180
chests[33201] = 29703180
chests[33205] = 28203520
chests[33204] = 26806490
chests[33206] = 64607040
chests[33207] = 59204950
chests[33208] = 69503290
chests[33209] = 54007820
chests[33210] = 47602760
-- Coords End

local info = { }
info[36703410] = { "Moss-Covered Chest", "One-Time Chest 000" }
info[25502720] = { "Moss-Covered Chest", "One-Time Chest 001" }
info[27403910] = { "Moss-Covered Chest", "One-Time Chest 002" }
info[30703650] = { "Moss-Covered Chest", "One-Time Chest 003" }
info[22403540] = { "Moss-Covered Chest", "One-Time Chest 004" }
info[22104930] = { "Moss-Covered Chest", "One-Time Chest 005" }
info[24805300] = { "Moss-Covered Chest", "One-Time Chest 006" }
info[25704580] = { "Moss-Covered Chest", "One-Time Chest 007" }
info[22306810] = { "Moss-Covered Chest", "One-Time Chest 008" }
info[26806870] = { "Moss-Covered Chest", "One-Time Chest 009" }
info[31007630] = { "Moss-Covered Chest", "One-Time Chest 010" }
info[35307640] = { "Moss-Covered Chest", "One-Time Chest 011" }
info[38707160] = { "Moss-Covered Chest", "One-Time Chest 012" }
info[39807950] = { "Moss-Covered Chest", "One-Time Chest 013" }
info[34808420] = { "Moss-Covered Chest", "One-Time Chest 014" }
info[43608410] = { "Moss-Covered Chest", "One-Time Chest 015" }
info[47005370] = { "Moss-Covered Chest", "One-Time Chest 016" }
info[46704670] = { "Moss-Covered Chest", "One-Time Chest 017" }
info[51204570] = { "Moss-Covered Chest", "One-Time Chest 018" }
info[55504430] = { "Moss-Covered Chest", "One-Time Chest 019" }
info[58005070] = { "Moss-Covered Chest", "One-Time Chest 020" }
info[65704780] = { "Moss-Covered Chest", "One-Time Chest 021" }
info[63805920] = { "Moss-Covered Chest", "One-Time Chest 022" }
info[64907560] = { "Moss-Covered Chest", "One-Time Chest 023" }
info[60206600] = { "Moss-Covered Chest", "One-Time Chest 024" }
info[49706570] = { "Moss-Covered Chest", "One-Time Chest 025" }
info[53107080] = { "Moss-Covered Chest", "One-Time Chest 026" }
info[52706270] = { "Moss-Covered Chest", "One-Time Chest 027" }
info[61708850] = { "Moss-Covered Chest", "One-Time Chest 028" }
info[44206530] = { "Moss-Covered Chest", "One-Time Chest - Stump Center" }
info[26006140] = { "Moss-Covered Chest", "One-Time Chest - Stump SW Shore" }
info[24603850] = { "Moss-Covered Chest", "One-Time Chest - Stump West" }
info[29703180] = { "Moss-Covered Chest", "One-Time Chest - Steam Shore" }
info[29703180] = { "Moss-Covered Chest", "One-Time Chest - Ordo Lake Lower" }
info[28203520] = { "Sturdy Chest", "One-Time Chest - Carry Bird 1" }
info[26806490] = { "Sturdy Chest", "One-Time Chest - Carry Bird 2" }
info[64607040] = { "Sturdy Chest", "One-Time Chest - Gulp Frogs" }
info[59204950] = { "Sturdy Chest", "One-Time Chest - Hammer Cavern" }
info[69503290] = { "Smoldering Chest", "One-Time Chest - Ordo Chest 000" }
info[54007820] = { "Smoldering Chest", "One-Time Chest - Ordo Chest 001" }
info[47602760] = { "Blazing Chest", "One-Time Chest - Blazing Chest" }

function TimelessIsleChest:OnInitialize()
 local defaults = {
  profile = {
   enabled = true,
  },
 }

 self.db = LibStub("AceDB-3.0"):New("TimelessIsleChestDB", defaults, true)
end

function TimelessIsleChest:OnEnable()
end

function TimelessIsleChest:OnDisable()
end

function TimelessIsleChest:Loop()
 for i, v in pairs(chests.locs) do
  print (i, v)
  for j, w in pairs(chests.locs[i]) do
   print (j, w)
  end
 end
end

local handler = {}
do
	local function iter(t, prestate)
		if not t then return nil end
		local state, value = next(t, prestate)
		while state do
			if value then
				return state, nil, icon, db.icon_scale, db.icon_alpha
			end
			state, value = next(t, state)
		end
		return nil, nil, nil, nil, nil
	end
	function handler:GetNodes(mapFile)
		return iter, nodes[mapFile], nil
	end
end

function handler:OnEnter(mapFile, coord) -- Copied from handynotes
    if (not info[coord]) then return end
	
	local tooltip = self:GetParent() == WorldMapButton and WorldMapTooltip or GameTooltip
	if ( self:GetCenter() > UIParent:GetCenter() ) then -- compare X coordinate
		tooltip:SetOwner(self, "ANCHOR_LEFT")
	else
		tooltip:SetOwner(self, "ANCHOR_RIGHT")
	end

	tooltip:SetText(info[coord][1])
	if (info[coord][2] ~= nil) then
	 tooltip:AddLine(info[coord][2], nil, nil, nil, true)
	end
	tooltip:Show()
end

function handler:OnLeave(mapFile, coord)
	if self:GetParent() == WorldMapButton then
		WorldMapTooltip:Hide()
	else
		GameTooltip:Hide()
	end
end

function module:OnInitialize()
	self.db = TimelessIsleChest.db:RegisterNamespace("HandyNotes", {
		profile = {
			icon_scale = 1.0,
			icon_alpha = 1.0,
		},
	})
	db = self.db.profile
	HandyNotes:RegisterPluginDB("TimelessIsleChest", handler, {
		type = "group",
		name = "TimelessIsleChest",
		desc = "Locations of treasure chests on Timeless Isle.",
		get = function(info) return db[info.arg] end,
		set = function(info, v)
			db[info.arg] = v
			module:SendMessage("HandyNotes_NotifyUpdate", "TimelessIsleChest")
		end,
		args = {
			desc = {
				name = "These settings control the look and feel of the icon.",
				type = "description",
				order = 0,
			},
			icon_scale = {
				type = "range",
				name = "Icon Scale",
				desc = "The scale of the icons",
				min = 0.25, max = 2, step = 0.01,
				arg = "icon_scale",
				order = 10,
			},
			icon_alpha = {
				type = "range",
				name = "Icon Alpha",
				desc = "The alpha transparency of the icons",
				min = 0, max = 1, step = 0.01,
				arg = "icon_alpha",
				order = 20,
			},
		},
	})
	self:RegisterEvent("WORLD_MAP_UPDATE", "UpdateNodes")
	self:UpdateNodes()
end

function module:UpdateNodes()
 --print("Nodes Updated")
 --nodes[zone][loc] = name
 if (nodes["TimelessIsle"] == nil) then
  nodes["TimelessIsle"] = { }
 end
 for i, v in pairs(chests) do
    if (not IsQuestFlaggedCompleted(i)) then
     nodes["TimelessIsle"][v] = i
	else
	 nodes["TimelessIsle"][v] = nil;
	end
 end

 self:SendMessage("HandyNotes_NotifyUpdate", "TimelessIsleChest")
end

function TimelessIsleChest:UpdateNodes()
 module:UpdateNodes()
end
