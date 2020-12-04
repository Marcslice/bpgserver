CREATE PROCEDURE FuncPortal(@playerId INT)
AS
BEGIN
    DECLARE @text varchar(150) = 'You found a weird yellow portal and like the great adventurer that you are, you choose to touch it. Your vision went black and you are back in town.'
    
    EXEC BackToTown @playerId = @playerId

    RETURN @text
END