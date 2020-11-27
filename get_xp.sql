CREATE FUNCTION get_xp (@combatId int)
RETURNS int
AS
	BEGIN
	DECLARE @xp int

	SELECT @xp = mobXP 
	FROM Combat INNER JOIN Mob ON combatMobId = mobId
	WHERE combatId = @combatId

	RETURN @xp
	END