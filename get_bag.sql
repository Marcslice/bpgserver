CREATE FUNCTION get_bag(@playerId int)
RETURNS @t Table (equipmentName varchar, EquipTypeName varchar, equipementSellPrice int, lootName varchar, lootSellPrice int)
AS
Begin
	INSERT INTO @t
	SELECT equipmentName, EquipTypeName, equipmentSellPrice, lootName, lootSellPrice 
		FROM(
		SELECT bagPlayerId, equipmentEquipTypeId, equipmentName, equipmentSellPrice, lootName, lootSellPrice 
			FROM(
			SELECT bagPlayerId, bagEquipmentId, lootName, lootSellPrice FROM BAG
			INNER JOIN Loot ON bagLootId = lootId WHERE bagPlayerId = @playerId) AS bagLoot
		INNER JOIN Equipment ON equipmentId = bagEquipmentId WHERE bagPlayerId = @playerId) AS bagEquip
	INNER JOIN EquipType ON equipmentEquipTypeId = EquipTypeId
	Return
End