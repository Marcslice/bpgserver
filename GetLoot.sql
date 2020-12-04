CREATE PROCEDURE GetLoot(@playerId INT)
AS
BEGIN
    DECLARE @lootId INT
    DECLARE @mobId INT
    DECLARE @questId INT

    SELECT @mobId = combatMobId FROM Combat WHERE combatPlayerId = @playerId
    SELECT @questId = pqQuestId FROM PlayerQuest WHERE pqPlayerId = @playerId AND pqStatus = 0

    SET @lootId = (SELECT TOP 1 mobDropLootId FROM mobDrop WHERE mobDropMobId = @mobId ORDER BY RAND() )

    INSERT INTO Bag (bagPlayerId, bagLootId)
    VALUES(@playerId, @lootId)

    IF EXISTS(SELECT 1 FROM QRLoot WHERE QRLootLootId = @lootId AND QRLootQuestId = @questId)
    BEGIN
        DECLARE @lootReqQT INT
        DECLARE @lootCount INT

        SET @lootCount = (SELECT COUNT(bagLootId) FROM Bag WHERE bagLootId = @lootId)
        SELECT @lootReqQT = QRLootQty FROM QRLoot WHERE QRLootQuestId = @questId

        IF (@lootReqQT = @lootCount)
        BEGIN
            DELETE FROM Bag
            WHERE bagPlayerId = @playerId AND bagLootId = @lootId

            UPDATE playerStatus
            SET playerStatus = 1
            WHERE playerStatusPlayerId = @playerId
        END 
    END
END