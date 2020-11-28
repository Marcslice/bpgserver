CREATE PROCEDURE GetRandomEvent(@playerId INT)
AS
BEGIN
    DECLARE @randomEvent INT = FLOOR( RAND()) * 101

    IF (@randomEvent > 79)
    BEGIN 
        RETURN FuncThief(@playerId)
    END
    ELSE IF (@randomEvent > 59)
    BEGIN
        RETURN FuncTrap(@playerId)
    END
    ELSE IF (@randomEvent > 39)
    BEGIN
        RETURN FuncHealingFountain(@playerId)
    END
    ELSE IF (@randomEvent > 19)
    BEGIN
        RETURN FuncTreasure(@playerId)
    END
    ELSE
    BEGIN
        RETURN FuncPortal(@playerId)
    END
END