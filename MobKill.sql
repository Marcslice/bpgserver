CREATE PROCEDURE MobKill(@playerId int)
AS
BEGIN
    DECLARE @combatId INT
    DECLARE @mobId INT
    DECLARE @xpGain INT
    DECLARE @questId INT = NULL

    SELECT @combatId = combatId, @mobId = combatMobId FROM Combat WHERE combatPlayerId = @playerId
    
    SELECT @xpGain = dbo.get_xp(@combatId)

    UPDATE Player 
    SET playerXP += @xpGain
    WHERE playerId = @playerId

    EXEC GetLoot @playerId = @playerId

    SELECT @questId = QRNQuestId FROM QRNemesis WHERE QRNMobId = @mobId

    IF (@questId != NULL)
    BEGIN
        IF EXISTS(SELECT 1 FROM PlayeQuest WHERE pqPlayerId = @playerId AND pqQuestId = @questId AND pqStatus = 0 )
        BEGIN
            DECLARE @questKill INT
            DECLARE @pqKillCount INT

            UPDATE PlayerQuest
            SET pqKillCount += 1
            WHERE pqPlayerId = @playerId AND pqQuestId = @questId

            SELECT @questKill = QRNQty FROM QRNemesis WHERE QRNQuestId = @questId
            SELECT @pqKillCount = pqKillCount FROM PlayerQuest WHERE pqQuestId = @questId AND pqPlayerId = @playerId 

            IF(@questKill = @pqKillCount)
            BEGIN
                UPDATE playerStatus
                SET playerStatus = 1
                WHERE playerStatusPlayerId = @playerId
            END
        END
        ELSE IF (dbo.CheckBag(@playerId) = 0)
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

    DELETE FROM Combat WHERE combatPlayerId = @playerId

END