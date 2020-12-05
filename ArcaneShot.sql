CREATE PROCEDURE ArcaneShot(@playerId int)
AS
BEGIN
    DECLARE @playerLVL INT
    DECLARE @playerINT INT
    DECLARE @shotDmg INT

    SELECT @playerINT = playerINT, @playerLVL = playerLVL FROM Player WHERE playerId = @playerId

    SET @shotDmg = @playerINT + @playerLVL

    UPDATE Combat
    SET combatMobCHP -= @shotDmg
    WHERE combatPlayerId = @playerId

    EXEC dbo.playerATK @playerId = @playeId 
END