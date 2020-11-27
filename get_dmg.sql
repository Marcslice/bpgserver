CREATE FUNCTION get_dmg(@playerid int)
	RETURNS int
	AS
	BEGIN
		DECLARE @DMG int

		select @DMG = SUM(equipDmg)
		FROM (
		select Distinct *  from dbo.get_equipment(@playerId)) AS sub
		RETURN @DMG
	END