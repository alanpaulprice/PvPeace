local _, addon = ...
addon.PvpMatchResults = {}

function addon:HidePvpMatchResults()
	PVPMatchResults:HookScript("OnShow", function()
		PVPMatchResults.header:Hide()
		PVPMatchResults.content.scrollCategories:Hide()
		PVPMatchResults.content.scrollBox:Hide()
		PVPMatchResults.content.scrollBar:Hide()
		PVPMatchResults.content.tabContainer:Hide()
	end)

	PVPMatchResults.content.earningsContainer:HookScript("OnShow", function()
		PVPMatchResults.content.earningsContainer.progressContainer.rating:Hide()
	end)
end
