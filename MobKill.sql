CREATE PROCEDURE MobKill(@playerId int)
AS
BEGIN
    DECLARE @combatId INT
    DECLARE @xpGain INT

    SELECT @combatId = combatId FROM Combat WHERE combatPlayerId = @playerId
    SELECT @xpGain = get_xp(@combatId)

    UPDATE Player 
    SET playerXP += @xpGain
    WHERE playerId = @playerId

    EXEC GetLoot @playerId = @playerId
    
    DELETE FROM Combat WHERE combatPlayerId = @playerId

    IF (CheckBag(@playerId) = 0)
    BEGIN
        UPDATE playerStatus
        SET playerStatus = 2
        WHERE playerStatusPlayerId = @playerId
    END
    ELSE
    BEGIN
        UPDATE playerStatus
        SET playerStatus = 16
        WHERE playerStatusPlayerId = @playerId
    END
END