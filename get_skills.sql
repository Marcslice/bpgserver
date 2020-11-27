CREATE FUNCTION get_skills(@playerId int)
RETURNS @t TABLE(skillId int, skillName nvarChar(15), skillDesc nvarChar(50))
AS
  BEGIN
	DECLARE @cPlayerLvl int
	SELECT @cplayerLvl = playerLvl FROM player WHERE playerId = @playerId

	INSERT INTO @t
	SELECT skillId, skillName, skillDescription 
	FROM (
		SELECT classSkillSkillId 
			FROM Player INNER JOIN classSkill
			ON playerClassId = classSkillClassId) as classSkills
		INNER JOIN Skills ON classSkillSkillId = skillId
	WHERE skillLvl <= @cPlayerLvl

  RETURN
  END