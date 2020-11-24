CREATE PROCEDURE PlayerAtk (@playerId INT)
AS
BEGIN
    
    DECLARE @dmg INT
    DECLARE @mobDEF INT
    DECLARE @mobLVL INT
    DECLARE @playerLVL INT
    DECLARE @lvlScaling INT

    IF FLOOR(RAND()*101) > 5.0
    BEGIN
        SET @dmg = GetPlayerDMG(@playerId)

        SELECT @mobDEF = mobDEF, @mobLVL = mobLVL FROM Mob INNER JOIN Combat ON mobId = combatMobId
        SELECT @playerLVL = playerLVL FROM Player INNER JOIN Combat ON playerId = @playerId


        IF @mobLVL < @playerLVL
        BEGIN
            SET @lvlScaling = @playerLVL - @mobLVL
            SET @mobDEF +=  @mobDEF * ((@lvlScaling * 20) / 100)
            SET @mobDEF = ROUND(@mobDEF)
        END

        SET @dmg = @dmg / (1 + (@mobDEF / 100)) 
    END
    ELSE
    BEGIN
        SET @dmg = 0
    END
    
    UPDATE combat 
    SET combatMobCHP = combatMobCHP - @dmg
    WHERE combatPlayerId = @playerId
    
    RETURN @dmg
END

