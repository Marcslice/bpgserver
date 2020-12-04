CREATE PROCEDURE FuncHealingFountain(@playerId INT)
AS
BEGIN
    DECLARE @text AS varchar(150) = 'You found a weird foutain. While weirdly located the water seems clean. Drinking from it you feel yourself revigorated. You fully healed your wounds.';
    DECLARE @playerHP INT

    SELECT @playerHP = playerHP FROM Player WHERE playerId = @playerId

    UPDATE Player
    SET playerCurrentHP = @playerHP
    WHERE playerId = @playerId
    
    RETURN @text
END