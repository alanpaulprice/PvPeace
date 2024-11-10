local _, addon = ...

function addon:HideWinsFromUIWidgetTopCenter()
	local winsTextFrame = UIWidgetTopCenterContainerFrame.widgetFrames[4457]

	if winsTextFrame ~= nil and winsTextFrame:IsShown() then
		winsTextFrame:Hide()
	end

	UIWidgetTopCenterContainerFrame:HookScript("OnEvent", function(self, event)
		local winsTextFrame = self.widgetFrames[4457]

		if
			C_PvP.IsRatedSoloShuffle()
			and event == "UPDATE_UI_WIDGET"
			and winsTextFrame ~= nil
			and winsTextFrame:IsShown()
		then
			winsTextFrame:Hide()
		end
	end)
end
