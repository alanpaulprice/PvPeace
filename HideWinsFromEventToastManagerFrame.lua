local _, addon = ...
addon.EventToastManagerFrame = {}

function addon:HideWinsFromEventToastManagerFrame()
	EventToastManagerFrame:HookScript("OnEvent", function(self, event)
		local toastSubtitle = self.currentDisplayingToast.SubTitle

		if event == "DISPLAY_EVENT_TOASTS" and toastSubtitle:IsShown() then
			toastSubtitle:Hide()
		end
	end)
end
