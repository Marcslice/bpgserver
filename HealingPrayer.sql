CREATE PROCEDURE HealingPlayer(@playerId int)
AS
BEGIN
    DECLARE @playerLVL INT
    DECLARE @playerWis INT
    DECLARE @heal INT

    SELECT @playerWis = playerWIS, @playerLVL = playerLVL FROM Player WHERE playerId = @playerId

    SET @heal = @playerWIS + (5 * @playerLVL)

    EXEC dbo.PlayerHeal @playerId = @playerId, @heal = @heal
END