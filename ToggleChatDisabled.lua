local addonName, addon = ...

function addon:ToggleChatDisabled()
	local _, zone = IsInInstance()
	local isPvpZone = zone == "pvp" or zone == "arena"
	local chatIsDisabled = C_SocialRestrictions.IsChatDisabled()

	if isPvpZone and not chatIsDisabled then
		C_SocialRestrictions.SetChatDisabled(true)
		print(addonName .. ": Chat has been disabled.")
	end

	if not isPvpZone and chatIsDisabled then
		C_SocialRestrictions.SetChatDisabled(false)
		print(addonName .. ": Chat has been enabled.")
	end
end
