CREATE PROCEDURE MobAtk (@combatId INT, @playerId INT)
AS
BEGIN
	DECLARE @combatLVL INT
	DECLARE @mobLVL INT
	DECLARE @mobATK INT
	DECLARE @lvlScaling INT = 0
	DECLARE @dmg INT
	
	SELECT @combatLVL = playerLVL, @mobLVL = mobLVL, @mobATK = mobATK
	FROM Combat INNER JOIN Mob ON combatMobId = mobId
		INNER JOIN Player ON combatPlayerId = playerId
	
	WHERE combatId = @combatId
	
	IF FLOOR(RAND()*101) > 5.0
	BEGIN
		IF @mobLVL < @combatLVL
		BEGIN
			SET @lvlScaling = @combatLVL - @mobLVL
			SET @dmg = (@mobATK + @mobATK * ((@lvlScaling * 20) / 100))
			SET @dmg = ROUND(@dmg)
		END
		ELSE
		BEGIN
			SET @dmg = @mobATK
		END
	END
	ELSE
	BEGIN
		SET @dmg = 0
	END
	
	SET @dmg = @dmg - (@dmg * (GetPlayerDEF(@playerId)/100))
	
	UPDATE Player
	SET playerCurrentHP = playerCurrentHP - @dmg
	WHERE playerId = @playerId
	
	RETURN @dmg
	
END



CREATE FUNCTION GetCombat (@playerId INT)
/*if no mob pick a random one else return mob from mobzone
AJOUTER MOBZONEPLAYERID ?*/
AS
BEGIN
	DECLARE @combatId INT
	
	IF EXIST (SELECT combatId FROM Combat WHERE combatPlayerId = @playerId)
	BEGIN
		SET @combatId = (SELECT combatId FROM Combat WHERE combatPlayerId = @playerId)
	END
	ELSE
	BEGIN
		DECLARE @mobId INT
		DECLARE @mobHP INT

		SET @mobId = (SELECT * FROM fairMob(@playerId) ORDER BY RAND() LIMIT 1)
		SET @mobHP = (SELECT mobHP FROM Mob WHERE mobId = @mobId)
		INSERT INTO Combat (combatPlayerId, combatMobId, combatMobCHP)
		VALUES (@playerId, @mobId ,@mobHP)

		SET @combatId = (SELECT combatId FROM Combat WHERE combatPlayerId = @playerId)
	END

	RETURN @combatId
END


/*use marc equip view*/
CREATE FUNCTION GetPlayerDEF // calc def value of all armor pieces
@playerId



CREATE FUNCTION GetPlayerLVL (@playerId INT)
AS
BEGIN
	DECLARE @playerLVL INT

	SELECT @playerLVL = playerLVL
	FROM Player
	WHERE playerId = @playerId

	RETURN @playerLVL
END



CREATE FUNCTION fairMob (@playerId INT)
RETURNS TABLE
AS
BEGIN
RETURN
	SELECT mobId
	FROM Mob
	WHERE mobLVL <= GetPlayerLVL(@playerId)
END



/*Useless here*/
CREATE FUNCTION GetPlayerZone (@playerId INT)
AS
BEGIN
	DECLARE @playerZoneId INT
	
	SELECT @playerZoneId = zoneId
	FROM Zones INNER JOIN Player ON zoneId = playerZoneId
	WHERE playerId = @playerId
	
	RETURN @playerZoneId
END