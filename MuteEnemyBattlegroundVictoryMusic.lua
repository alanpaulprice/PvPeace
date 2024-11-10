local addonName, addon = ...

function addon:MuteEnemyBattlegroundVictoryMusic()
	local factionIsHorde = GetBattlefieldArenaFaction() == 0
	local hordeVictoryMusic = 568480
	local allianceVictoryMusic = 569678

	if factionIsHorde then
		MuteSoundFile(allianceVictoryMusic)
	else
		MuteSoundFile(hordeVictoryMusic)
	end
end
