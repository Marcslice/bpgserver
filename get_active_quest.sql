CREATE FUNCTION get_active_quest(@playerId int)
	RETURNS int
AS
BEGIN
	DECLARE @questId int
SELECT @questId = pqQuestId FROM PlayerQuest
WHERE pqPlayerId = @playerId AND pqStatus = 0
return @questId
END