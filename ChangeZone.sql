CREATE PROCEDURE ChangeZone(@playerId INT)
AS
BEGIN
    DECLARE @zoneLVL INT
    DECLARE @lastZone INT

    SELECT @zoneLVL = zoneLVL FROM Zones INNER JOIN Player ON zoneId = playerZoneId WHERE playerId = @playerId
    SELECT @lastZone = COUNT(zoneId) FROM Zones

    IF (@zoneLVL < @lastZone)
    BEGIN
        UPDATE Player
        SET playerZoneId = playerZoneId + 1
        WHERE playerId = @playerId

        RETURN 1
    END

    RETURN 0
END