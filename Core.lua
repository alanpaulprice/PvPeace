local _, addon = ...

function addon:ADDON_LOADED(name)
	if name == "Blizzard_PVPUI" then
		addon:HideRatingFromConquestFrame()
	end
end

function addon:PLAYER_ENTERING_WORLD()
	local _, zone = IsInInstance()
	local isPvpZone = zone == "pvp" or zone == "arena"

	if isPvpZone then
		addon:HidePvpMatchScoreboard()
		addon:HidePvpMatchResults()
	end

	if C_PvP.IsRatedSoloShuffle() then
		addon.HideWinsFromUIWidgetTopCenter()
		addon.HideWinsFromEventToastManagerFrame()
	end

	addon.ToggleChatDisabled(isPvpZone)
end

function addon:CHAT_DISABLED_CHANGED()
	addon:ToggleChatDisabled()
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:RegisterEvent("CHAT_DISABLED_CHANGED")
events:SetScript("OnEvent", function(self, event, ...)
	addon[event](self, ...)
end)
