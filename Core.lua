--! HIDE TIER IN SIDEBAR

local addonName, addon = ...

local function onConquestFrameButtonEnter()
	ConquestTooltip:Hide()
end

local function onRatedPanelShow(self)
	self.Tier:Hide()
end

local function onConquestFrameUpdate()
	ConquestFrame.RatedSoloShuffle.Tier:Hide()
	ConquestFrame.RatedSoloShuffle.CurrentRating:Hide()

	ConquestFrame.RatedBGBlitz.CurrentRating:Hide()
	ConquestFrame.RatedBGBlitz.Tier:Hide()

	ConquestFrame.Arena2v2.Tier:Hide()
	ConquestFrame.Arena2v2.CurrentRating:Hide()

	ConquestFrame.Arena3v3.Tier:Hide()
	ConquestFrame.Arena3v3.CurrentRating:Hide()

	ConquestFrame.RatedBG.Tier:Hide()
	ConquestFrame.RatedBG.CurrentRating:Hide()
end

local function addScriptHooksToConquestFrameButtons()
	local conquestFrameButtons = {
		ConquestFrame.RatedSoloShuffle,
		ConquestFrame.RatedBGBlitz,
		ConquestFrame.Arena2v2,
		ConquestFrame.Arena3v3,
		ConquestFrame.RatedBG,
	}

	for _, button in ipairs(conquestFrameButtons) do
		button:HookScript("OnEnter", onConquestFrameButtonEnter)
	end
end

function addon:Initialize()
	hooksecurefunc(PVPQueueFrame.HonorInset.RatedPanel, "Show", onRatedPanelShow)
	hooksecurefunc("ConquestFrame_Update", onConquestFrameUpdate)
	addScriptHooksToConquestFrameButtons()
end

function addon:OnAddonLoaded(_, name)
	if name == "Blizzard_PVPUI" then
		addon:Initialize()
	end
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:SetScript("OnEvent", addon.OnAddonLoaded)
