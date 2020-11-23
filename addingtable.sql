CREATE TABLE PlayerQuest
(
    pqId int IDENTITY,  
    pqPlayerId int NOT NULL,
	pqQuestId int NOT NULL,
	pqKillCount int,
	pqStatus boolean NOT NULL,
	

    CONSTRAINT PK_pqId PRIMARY KEY (pqId),
    CONSTRAINT CHK_pqKillCount CHECK (pqKillCount >= 0)
)

go


ALTER TABLE PlayerQuest
    ADD CONSTRAINT FK_pqPlayerId FOREIGN KEY (pqPlayerId) REFERENCES Player(playerId),
    CONSTRAINT FK_pqQuestId FOREIGN KEY (pqQuestId) REFERENCES Quest(questId);
	
go