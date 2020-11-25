CREATE PROCEDURE GetQuest(@playerId INT)
AS
BEGIN
    DECLARE @questId INT
    DECLARE @zoneId INT

    SELECT @zoneId = playerZoneId FROM Player WHERE playerId = @playerId

    SET @questId = (SELECT TOP 1 questId FROM (SELECT questId FROM Quest WHERE questId NOT IN (SELECT playerQuestId FROM PlayerQuest WHERE playerQuestPlayerId = @playerId) ) AS avaibleQuest ORDER BY RAND())

    INSERT INTO PlayerQuest (pqPlayerId, pqQuestId, pqStatus)
    VALUES (@playerId, @questId, 0)

    IF EXISTS(SELECT 1 FROM QRNemesis WHERE QRNQuestId = @questId)
    BEGIN
        UPDATE PlayerQuest
        SET pqKillCount = 0
        WHERE playerQuestPlayerId = @playerId
    END
END