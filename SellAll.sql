CREATE PROCEDURE SellAll(@playerId int)
AS
BEGIN
    DECLARE @gold INT

    SELECT @gold = SUM(equipmentSellPrice) FROM Equipment INNER JOIN Bag ON equipmentId = bagEquipmentId WHERE bagPlayerId = @playerId

    UPDATE Player
    SET playerGold += @gold
    WHERE playerId = @playerId

    EXEC SellJunk @playerId = @playerId
END