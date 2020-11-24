CREATE PROCEDURE DropBag(@playerId INT)
AS
BEGIN
    DELETE FROM Bag WHERE bagPlayerId = @playerId

    UPDATE Player
    SET playerCurrentInv = 0
    WHERE playerId = @playerId
END