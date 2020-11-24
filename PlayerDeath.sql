CREATE PROCEDURE PlayerDeath(@playerId INT)
AS
BEGIN
    DELETE FROM Combat WHERE combatPlayerId = @playerId

    EXEC DropBag @playerId = @playerId
    EXEC BackToTown @playerId = @playerId
END