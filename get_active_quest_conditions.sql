CREATE FUNCTION get_active_quest_conditions(@playerId int)
	RETURNS @conditions TABLE (targetName varchar, targetQty int, lootName varchar, lootQty int)
AS
	BEGIN
		DECLARE @questId int;

		SELECT @questId = dbo.get_active_quest(@playerId);	
		INSERT INTO @conditions
		SELECT mobName, QRNQty, lootName, QRLootQty
		FROM 
			(SELECT mobName, QRNQty, QRlootId, QRLootQty 
			FROM
				(SELECT mobName, QRNQty FROM QRNemesis INNER JOIN Mob ON QRNMobId = MobId WHERE QRNQuestId = @questId) AS mobXQRN
			INNER JOIN QRLoot ON QRLootQuestId = @questId) as mobXqrnXqrl
		INNER JOIN loot ON lootId = QRLootId		
		RETURN
	END



	