CREATE FUNCTION GetPlayerLVL (@playerId INT)
RETURNS INTEGER
BEGIN
	DECLARE @playerLVL INT

	SELECT @playerLVL = playerLVL
	FROM Player
	WHERE playerId = @playerId

	RETURN @playerLVL
END