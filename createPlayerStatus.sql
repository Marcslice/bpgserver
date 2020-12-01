use dbbpg

CREATE TABLE playerStatus(
playerStatusId int Identity,
playerStatusPlayerId int NOT NULL,
playerStatus int NOT NULL,
playerActiveSkillId int 

CONSTRAINT FK_playerStatusPlayerId FOREIGN KEY (playerStatusPlayerId) REFERENCES player(playerId),
CONSTRAINT FK_playerActiveSkillId FOREIGN KEY (playerActiveSkillId) REFERENCES Skill(skillId)
)
go