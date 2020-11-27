ALTER FUNCTION get_equipment (@playerId int)
	Returns @t TABLE (piece nvarchar(15), equipName nvarchar(30), equipDmg int, equipDef int)	
AS
  BEGIN
	Declare @piece AS nvarChar(15)
	Declare @equipName AS nvarChar(15)
	Declare @equipDmg AS int
	Declare @equipDef AS int
	
	SELECT @piece = N'Helmet', @equipName = equipmentName, @equipDmg = equipmentATK, @equipDef = equipmentDEF
	FROM player INNER JOIN Equipment ON playerHelmetId = equipmentId
	WHERE playerId = @playerId

	INSERT INTO @t (piece, equipName, equipDmg, equipDef)
	VALUES (@piece, @equipName, @equipDmg, @equipDef)

	SELECT @piece = N'Earrings', @equipName = equipmentName, @equipDmg = equipmentATK, @equipDef = equipmentDEF
	FROM player INNER JOIN Equipment ON playerEarringsId = equipmentId
	WHERE playerId = @playerId

	INSERT INTO @t (piece, equipName, equipDmg, equipDef)
	VALUES (@piece, @equipName, @equipDmg, @equipDef)

	SELECT @piece = N'Necklace', @equipName = equipmentName,@equipDmg = equipmentATK, @equipDef = equipmentDEF
	FROM player INNER JOIN Equipment ON playerNecklassId = equipmentId
	WHERE playerId = @playerId

	INSERT INTO @t (piece, equipName, equipDmg, equipDef)
	VALUES (@piece, @equipName, @equipDmg, @equipDef)

	SELECT @piece = N'Armor', @equipName = equipmentName, @equipDmg = equipmentATK, @equipDef = equipmentDEF
	FROM player INNER JOIN Equipment ON playerArmorId = equipmentId
	WHERE playerId = @playerId

	INSERT INTO @t (piece, equipName, equipDmg, equipDef)
	VALUES (@piece, @equipName, @equipDmg, @equipDef)

	SELECT @piece = N'Gloves', @equipName = equipmentName,@equipDmg = equipmentATK, @equipDef = equipmentDEF
	FROM player INNER JOIN Equipment ON playerGlovesId = equipmentId
	WHERE playerId = @playerId

	INSERT INTO @t (piece, equipName, equipDmg, equipDef)
	VALUES (@piece, @equipName, @equipDmg, @equipDef)

	SELECT @piece = N'LRing', @equipName = equipmentName,@equipDmg = equipmentATK, @equipDef = equipmentDEF
	FROM player INNER JOIN Equipment ON playerLRingId = equipmentId
	WHERE playerId = @playerId

	INSERT INTO @t (piece, equipName, equipDmg, equipDef)
	VALUES (@piece, @equipName, @equipDmg, @equipDef)

	SELECT @piece = N'RRing', @equipName = equipmentName, @equipDmg = equipmentATK, @equipDef = equipmentDEF
	FROM player INNER JOIN Equipment ON playerRRingId = equipmentId
	WHERE playerId = @playerId

	INSERT INTO @t (piece, equipName, equipDmg, equipDef)
	VALUES (@piece, @equipName, @equipDmg, @equipDef)

	SELECT @piece = N'LWeap', @equipName = equipmentName,@equipDmg = equipmentATK, @equipDef = equipmentDEF
	FROM player INNER JOIN Equipment ON playerLWeapId = equipmentId
	WHERE playerId = @playerId

	INSERT INTO @t (piece, equipName, equipDmg, equipDef)
	VALUES (@piece, @equipName, @equipDmg, @equipDef)

	SELECT @piece = N'RWeap', @equipName = equipmentName,@equipDmg = equipmentATK, @equipDef = equipmentDEF
	FROM player INNER JOIN Equipment ON playerRWeapId = equipmentId
	WHERE playerId = @playerId

	INSERT INTO @t (piece, equipName, equipDmg, equipDef)
	VALUES (@piece, @equipName, @equipDmg, @equipDef)

	SELECT @piece = N'Belt', @equipName = equipmentName,@equipDmg = equipmentATK, @equipDef = equipmentDEF
	FROM player INNER JOIN Equipment ON playerBeltId = equipmentId
	WHERE playerId = @playerId

	INSERT INTO @t (piece, equipName, equipDmg, equipDef)
	VALUES (@piece, @equipName, @equipDmg, @equipDef)

	SELECT @piece = N'Legs', @equipName = equipmentName,@equipDmg = equipmentATK, @equipDef = equipmentDEF
	FROM player INNER JOIN Equipment ON playerLegsId = equipmentId
	WHERE playerId = @playerId

	INSERT INTO @t (piece, equipName, equipDmg, equipDef)
	VALUES (@piece, @equipName, @equipDmg, @equipDef)

	SELECT @piece = N'Boots', @equipName = equipmentName,@equipDmg = equipmentATK, @equipDef = equipmentDEF
	FROM player INNER JOIN Equipment ON playerBootsId = equipmentId
	WHERE playerId = @playerId

	INSERT INTO @t (piece, equipName, equipDmg, equipDef)
	VALUES (@piece, @equipName, @equipDmg, @equipDef)

	RETURN
  END