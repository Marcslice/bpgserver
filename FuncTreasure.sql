CREATE FUNCTION FuncTreasure(@playerId INT)
RETURNS varchar(100)
AS
BEGIN
    DECLARE @text varchar(100) = 'You took a quick rest by a lake. While cleaning you face you found a box full of gold laying there. You gained '
    DECLARE @qtyGoldT varchar(5)
    DECLARE @qtyGold INT

    SET @qtyGold = (SELECT CAST(FLOOR( RAND() * (1001-400) + 400)))
    SET @qtyGoldT = CAST(@qtyGold AS varchar)

    UPDATE Player
    SET playerGold += @qtyGold
    WHERE playerId = @playerId

    RETURN @text + @qtyGoldT
END