CREATE PROCEDURE UseSkill(@playerId int)
AS
BEGIN
    DECLARE @skillId INT
    DECLARE @skillCost INT
    DECLARE @playerMP INT

    SELECT @skillId = playerStatusSkillId FROM playerStatus WHERE playerStatusPlayerId = @playerId
    SELECT @playerMP = playerCurrentMP FROM Player WHERE playerId = @playerId
    SELECT @skillCost = skillManaCost FROM Skill WHERE skillId = @skillId

    IF (@playerMP >= @skillCost)
    BEGIN
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
    ELSE
        EXEC dbo.PlayerAtk @playerId = @playerId
END