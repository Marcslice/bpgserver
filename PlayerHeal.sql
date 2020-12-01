CREATE PROCEDURE PlayerHeal (@playerId int, @heal int)
AS
BEGIN
    DECLARE @playerMaxHP INT
    DECLARE @playerHP INT

    SELECT @playerMaxHP = playerHP FROM Player WHERE playerId = @playerId
    SELECT @playerHP = playerCurrentHP FROM Player WHERE playerId = @playerId

    if(@playerHP + @heal <= @playerMaxHP)
    BEGIN
        UPDATE Player
        SET playerCurrentHP += @heal
        WHERE playerId = @playerId
    END
    ELSE
    BEGIN
        UPDATE Player
        SET playerCurrentHP = @playerMaxHP
        WHERE playerId = @playerId
    END
END