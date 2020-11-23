/** charInfo_static **/

CREATE FUNCTION get_character_info (@playerId int)
RETURNS TABLE
AS
RETURN (SELECT playerName, className as playerClassName, raceName as playerRaceName
  FROM
    (SELECT playerId, playerName, playerRaceId, playerClassId, className
    FROM Player INNER JOIN Class ON playerClassId = ClassId)
    AS playerXClass INNER JOIN Race ON playerRaceId = raceId
    WHERE playerId = @playerId)
;