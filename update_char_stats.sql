
CREATE PROCEDURE update_char_stats(
									@playerId int,
									@playerStr int,
									@playerDex int,
									@playerCon int,
									@playerInt int,
									@playerWis int,
									@playerCha int
									)

AS
	BEGIN
		DECLARE @cStr int;
		DECLARE @cDex int;
		DECLARE @cCon int;
		DECLARE @cInt int;
		DECLARE @cWis int;
		DECLARE @cCha int;

		SELECT @cStr = playerSTR, @cDex = playerDEX, @cCon = playerCON, @cInt = playerINT, @cWis = playerWIS, @cCha = playerCHA FROM player WHERE playerId = @playerId

		UPDATE dbo.Player
		SET playerSTR = @cStr + @playerStr, playerDEX = @cDex + @playerDex, playerCON = @cCon + @playerCon, playerINT = @cInt + @playerInt, playerWIS = @cWis + @playerWis, playerCHA = @cCha + @playerCha
		WHERE playerId = @playerId
	END
