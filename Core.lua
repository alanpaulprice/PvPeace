local addonName, addon = ...

function addon:OnAddonLoaded(_, name)
	if name == "Blizzard_PVPUI" then
		addon.PvpUi:Initialize()
	end
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:SetScript("OnEvent", addon.OnAddonLoaded)
