CREATE FUNCTION GetPlayerZone (@playerId INT)
RETURNS INTEGER
AS
BEGIN
	DECLARE @playerZoneId INT
	
	SELECT @playerZoneId = zoneId
	FROM Zones INNER JOIN Player ON zoneId = playerZoneId
	WHERE playerId = @playerId
	
	RETURN @playerZoneId
END