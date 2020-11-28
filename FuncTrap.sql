CREATE FUNCTION FuncTrap(@playerId INT)
RETURNS varchar(150)
AS
BEGIN
    DECLARE @text varchar(145) = "You were to busy looking at the butterflies and you stepped in a bear trap losing a bunch of HP. You lost "
    DECLARE @qtyHPT varchar(5)
    DECLARE @qtyHP INT
    DECLARE @playerHP INT

    SET @qtyHP = (SELECT CAST(FLOOR( RAND() * (21 - 10) + 10)))
    SELECT @playerHP = playerCurrentHP FROM Player WHERE playerId = @playerId

    IF(@qtyHP >= @playerHP)
    BEGIN
        SET @qtyHPT = "all you HP"

        EXEC PlayerDeath @playerId = @playerId
        
        UPDATE Player
        SET playerCurrentHP = 0
        WHERE playerId = @playerId
    END
    ELSE
    BEGIN
        UPDATE Player
        SET playerCurrentHP -= @qtyHP
        WHERE playerId = @playerId

        SET @qtyHPT = CAST(@qtyHP AS varchar)
    END

    RETURN @text + @qtyHPT
END