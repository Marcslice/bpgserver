CREATE PROCEDURE PlayerDeath(@playerId INT)
AS
BEGIN
    DELETE FROM Combat WHERE combatPlayerId = @playerId

    EXEC DropBag @playerId = @playerId
    
    UPDATE playerStatus
    SET playerStatus = 8
    WHERE playerStatusPlayerId = @playerId
END