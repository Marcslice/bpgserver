CREATE PROCEDURE GetQuest(@playerId INT)
AS
BEGIN
    DECLARE @questId INT
    DECLARE @zoneId INT

    SELECT @zoneId = playerZoneId FROM Player WHERE playerId = @playerId

    SET @questId = (SELECT TOP 1 questId FROM (SELECT questId FROM Quest WHERE questId NOT IN (SELECT playerQuestId FROM PlayerQuest WHERE playerQuestPlayerId = @playerId) AND questZoneId = @zoneId ) AS avaibleQuest ORDER BY RAND())
    
    IF (@questId IS null)
    BEGIN
        IF (ChangeZone(@playerId) = 0)
        BEGIN
            EXEC TheEnd @playerId = @playerId
        END
    END
    ELSE
    BEGIN
        INSERT INTO PlayerQuest (pqPlayerId, pqQuestId, pqStatus)
        VALUES (@playerId, @questId, 0)

        IF EXISTS(SELECT 1 FROM QRNemesis WHERE QRNQuestId = @questId)
        BEGIN
            UPDATE PlayerQuest
            SET pqKillCount = 0
            WHERE playerQuestPlayerId = @playerId
        END

        UPDATE playerStatus
        SET playerStatus = 2
        WHERE playerStatusPlayerId = @playerId
    END
END