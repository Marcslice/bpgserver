CREATE FUNCTION GetPlayerDMG(@playerId INT)
RETURNS INTEGER
AS
BEGIN
    DECLARE @dmg INT

    SET @dmg = get_dmg(@playerId)
    
    IF EXISTS (SELECT playerLWeapId FROM Player WHERE playerId = @playerId)
    BEGIN
        DECLARE @lWeapId INT
        DECLARE @rWeapId INT

        SET @lWeapId = (SELECT playerLWeapId FROM Player WHERE playerId = @playerId)
        SET @rWeapId = (SELECT playerRWeapId FROM Player WHERE playerId = @playerId)
        
        IF (@lWeapId = @rWeapId)
        BEGIN
            SET @dmg = (@dmg/2) * 1.5
        END
    END
    RETURN @dmg
END