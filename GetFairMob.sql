CREATE FUNCTION fairMob (@playerId INT)
RETURNS TABLE
AS
RETURN
	SELECT mobId
	FROM Mob
	WHERE mobLVL <= dbo.GetPlayerLVL(@playerId)
