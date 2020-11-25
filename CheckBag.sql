CREATE FUNCTION CheckBag(@playerId INT)
RETURNS BIT
AS
BEGIN
    DECLARE @invMax INT
    DECLARE @invCount INT

    SELECT @invMax = playerMaxInv FROM Player WHERE playerId = @playerId
    SELECT @invCount = playerCurrentInv FROM Player WHERE playerId = @playerId
    IF (@invMax = @invCount)
        RETURN 1
    RETURN 0 
END