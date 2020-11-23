/** charInfo_dynamic **/

CREATE FUNCTION get_character_stats (@playerId int)
RETURNS TABLE
AS
RETURN SELECT playerId, playerLVL, playerHP, playerCurrentHP, playerMP, playerCurrentMP, playerSTR, playerInt, playerCon, playerWis, playerDex, playerCha, playerAtk, playerDef, playerXp
  FROM Player WHERE playerId = @playerId