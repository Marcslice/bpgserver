SELECT equipmentName, EquipTypeName, equipmentSellPrice, lootName, lootSellPrice 
	FROM(
	SELECT equipmentEquipTypeId, equipmentName, equipmentSellPrice, lootName, lootSellPrice 
		FROM(
		SELECT bagEquipmentId, lootName, lootSellPrice FROM BAG
		INNER JOIN Loot ON bagLootId = lootId) AS bagLoot 
	INNER JOIN Equipment ON equipmentId = bagEquipmentId) AS bagEquip
INNER JOIN EquipType ON equipmentEquipTypeId = EquipTypeId