CREATE PROCEDURE SellJunk(@playerId int)
AS
BEGIN
    DECLARE @currentQuestId INT
    DECLARE @gold INT

    SET @currentQuestId = get_active_quest(@playerId)

    SELECT @gold = SUM(lootSellPrice) FROM Loot INNER JOIN Bag ON lootId = bagLootId WHERE lootId NOT IN(SELECT QRLootLootId FROM QRLoot WHERE QRLootQuestId = @currentQuestId)

    UPDATE Player
    SET playerGold += @gold
    WHERE playerId = @playerId
END