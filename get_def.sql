CREATE FUNCTION get_def(@playerid int)
	RETURNS int
	AS
	BEGIN
		DECLARE @DEF int

		select @DEF = SUM(equipDEF)
		FROM (
		select Distinct *  from dbo.get_equipment(@playerId)) AS sub
		RETURN @DEF
	END