CREATE PROCEDURE UseSkill(@playerId int)
AS
BEGIN
    DECLARE @skillId INT

    SELECT @skillId = playerStatusSkillId FROM playerStatus WHERE playerStatusPlayerId = @playerId

    IF @skillId = 1
    BEGIN
        EXEC dbo.ArcaneShot @playerId = @playerId
    END
    ELSE IF @skillId = 2
    BEGIN
        EXEC dbo.HealingPrayer @playerId = @playerId
    END
    ELSE IF @skillId = 3
    BEGIN
        EXEC dbo.FlurryOfBlows @playerId = @playerId
    END
    ELSE IF @skillId = 4
    BEGIN
        EXEC dbo.Smite @playerId = @playerId
    END
END