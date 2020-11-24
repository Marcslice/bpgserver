CREATE FUNCTION GetMobInfo(@mobId INT)
RETURNS TABLE
AS
BEGIN
RETURN
    SELECT mobName, mobDesc, combatMobCHP, mobHP FROM Mob INNER JOIN Combat ON mobId = combatMobId WHERE mobId = @mobId
END


/*Kinda useless*/
CREATE FUNCTION GetMobDef(@mobId INT)
AS
BEGIN
    DECLARE @mobDef INT
    SET @mobDef = SELECT mobDef FROM Mob WHERE mobId = @mobId
    RETURN @mobDef
END