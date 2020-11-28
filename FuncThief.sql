CREATE FUNCTION FuncThief(@playerId INT)
RETURNS varchar(150)
AS
BEGIN
    DECLARE @text VARCHAR(140) = "You met a thief and he stole gold from you. You lost "
    DECLARE @qtyStolenT VARCHAR(10)
    DECLARE @qtyStolen INT
    DECLARE @playerGold INT

    SET @qtyStolen = (SELECT CAST(FLOOR( RAND() * (501-100) + 100)))
    SELECT @playerGold = playerGold FROM Player WHERE playerId = @playerId

    IF (@qtyStolen >= @playerGold)
    BEGIN
        SET @qtyStolenT = "all your gold."
        UPDATE Player
        SET playerGold = 0
        WHERE playerId = @playerId
    END
    ELSE
    BEGIN
        SET @qtyStolenT = CAST(@qtyStolen AS varchar)

        UPDATE Player
        SET playerGold -= @qtyStolen
        WHERE playerId = @playerId
    END

    RETURN @text + @qtyStolenT
END