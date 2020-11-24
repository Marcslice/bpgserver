CREATE PROCEDURE MobAtk (@playerId INT)
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
	WHERE playerId = @playerId
	
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