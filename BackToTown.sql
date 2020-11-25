CREATE PROCEDURE BackToTown(@playerId INT)
AS
BEGIN
    UPDATE playerStatus
    SET playerStatus = 0
    WHERE playerStatusPlayerId = @playerId
END