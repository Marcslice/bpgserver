CREATE FUNCTION GetPlayerMana(@playerId int)
RETURNS INTEGER
AS
BEGIN
    DECLARE @mana INT

    SELECT @mana = playerCurrentMP FROM Player WHERE playerId = @playerId

    RETURN @mana
END