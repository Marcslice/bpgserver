CREATE PROCEDURE Smite(@playerId int)
AS
BEGIN
    DECLARE @playerLVL INT
    DECLARE @playerWis INT
    DECLARE @smiteDmg INT

    SELECT @playerWis = playerWIS, @playerLVL = playerLVL FROM Player WHERE playerId = @playerId

    SET @smiteDmg = @playerWis + (5 * @playerLVL )

    UPDATE Combat
    SET combatMobCHP -= @smiteDmg
    WHERE combatPlayerId = @playerId

END