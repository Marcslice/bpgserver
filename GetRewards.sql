CREATE PROCEDURE GetRewards(@playerId INT)
AS
BEGIN
    DECLARE @questId INT
    DECLARE @gold INT
    DECLARE @xp INT
    DECLARE @equipId INT

    SELECT @questId = pqQuestId FROM PlayerQuest WHERE pqPlayerId = @playerId AND pqStatus = 0

    SELECT @gold = questGold, @xp = questXp, @equipId = ISNULL(questEquipId, -1) FROM Quest WHERE questId = @questId

    UPDATE Player
    SET playerGold += @gold, playerXp += @xp
    WHERE playerId = @playerId

    IF(@equipId != -1)
    BEGIN
        INSERT INTO Bag (bagPlayerId, bagEquipmentId)
        VALUES (@playerId, @equipId)
    END

    UPDATE PlayerQuest
    SET pqStatus = 1
    WHERE pqQuestId = @questId AND pqPlayerId = @playerId
END