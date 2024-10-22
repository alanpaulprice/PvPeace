local _, addon = ...
addon.PvpMatchScoreboard = {}

function addon:HidePvpMatchScoreboard()
	PVPMatchScoreboard:HookScript("OnShow", function()
		PVPMatchScoreboard:Hide()
	end)
end
