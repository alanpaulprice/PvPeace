local _, addon = ...

local function OnWorldEntranceOrZoneChange()
	local _, instanceType = IsInInstance()

	if instanceType == "pvp" or instanceType == "arena" then
		addon:HidePvpMatchScoreboard()
		addon:HidePvpMatchResults()
	end

	if C_PvP.IsRatedSoloShuffle() then
		addon.HideWinsFromUIWidgetTopCenter()
		addon.HideWinsFromEventToastManagerFrame()
	end

	addon.ToggleChatDisabled()
end

function addon:ADDON_LOADED(name)
	if name == "Blizzard_PVPUI" then
		addon:HideRatingFromConquestFrame()
	end
end

function addon:PLAYER_ENTERING_WORLD()
	OnWorldEntranceOrZoneChange()
end

function addon:ZONE_CHANGED_NEW_AREA()
	OnWorldEntranceOrZoneChange()
end

function addon:CHAT_DISABLED_CHANGED()
	addon:ToggleChatDisabled()
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:RegisterEvent("ZONE_CHANGED_NEW_AREA")
events:RegisterEvent("CHAT_DISABLED_CHANGED")
events:SetScript("OnEvent", function(self, event, ...)
	addon[event](self, ...)
end)
