CREATE PROCEDURE GetLoot(@playerId INT)
AS
BEGIN
    DECLARE @lootId INT
    DECLARE @mobId INT

    SELECT @mobId = combatMobId FROM Combat WHERE playerId = @playerId

    SET @lootId = (SELECT TOP 1 mobDropLootId FROM mobDrop WHERE mobDropMobId = @mobId ORDER BY RAND() )

    INSERT INTO Bag (bagPlayerId, bagLootId)
    VALUES(@playerId, @lootId)

END