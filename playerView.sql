/**PLAYER VIEW**/

CREATE VIEW vCharacters AS
  SELECT playerId, playerName, className as playerClassName, raceName as playerRaceName, playerLVL
  FROM
    (SELECT playerId, playerName, playerRaceId, playerClassId, className, playerLVL
    FROM Player INNER JOIN Class ON playerClassId = ClassId)
    AS playerXClass INNER JOIN Race ON playerRaceId = raceId