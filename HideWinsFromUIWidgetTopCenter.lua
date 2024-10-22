local _, addon = ...

function addon:HideWinsFromUIWidgetTopCenter()
	UIWidgetTopCenterContainerFrame:HookScript("OnEvent", function(self, event)
		local winsTextFrame = self.widgetFrames[4457]

		if event == "UPDATE_UI_WIDGET" and winsTextFrame ~= nil and winsTextFrame:IsShown() then
			winsTextFrame:Hide()
		end
	end)
end
