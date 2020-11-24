CREATE FUNCTION GetMobInfo(@mobId INT)
RETURNS TABLE
AS
RETURN
    SELECT mobName, mobDesc, combatMobCHP, mobHP FROM Mob INNER JOIN Combat ON mobId = combatMobId WHERE mobId = @mobId
