CREATE PROCEDURE GetCombat (@playerId INT)
/*if no mob pick a random one else return mob from mobzone
AJOUTER MOBZONEPLAYERID ?*/
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM Combat WHERE combatPlayerId = @playerId)
	BEGIN
		DECLARE @mobId INT
		DECLARE @mobHP INT
        DECLARE @mobLVL INT
        DECLARE @playerLVL INT
        DECLARE @lvlScaling INT

		SET @mobId = (SELECT TOP 1 * FROM fairMob(@playerId) ORDER BY RAND())
		SELECT @mobHP = mobHP FROM Mob WHERE mobId = @mobId
        SELECT @mobLVL = mobLVL FROM mob WHERE mobId = @
        SELECT @playerLVL = playerLVL FROM Player WHERE playerId = @playerId

        if(@mobLVL < @playerLVL)
        BEGIN
            SET @lvlScaling = @playerLVL - @mobLVL
            SET @mobHP += (10 * @lvlScaling)
        END
        

		INSERT INTO Combat (combatPlayerId, combatMobId, combatMobCHP)
		VALUES (@playerId, @mobId ,@mobHP)
	END
END