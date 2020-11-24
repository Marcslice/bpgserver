CREATE PROCEDURE GetCombat (@playerId INT)
/*if no mob pick a random one else return mob from mobzone
AJOUTER MOBZONEPLAYERID ?*/
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM Combat WHERE combatPlayerId = @playerId)
	BEGIN
		DECLARE @mobId INT
		DECLARE @mobHP INT

		SET @mobId = (SELECT TOP 1 * FROM fairMob(@playerId) ORDER BY RAND())
		SET @mobHP = (SELECT mobHP FROM Mob WHERE mobId = @mobId)

		INSERT INTO Combat (combatPlayerId, combatMobId, combatMobCHP)
		VALUES (@playerId, @mobId ,@mobHP)
	END
END