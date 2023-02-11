-- =============================================
-- Create basic index 
-- =============================================
USE [WorldCup2022]
GO


CREATE INDEX IN_Player
ON [Player].[Players]
(
	[Player_Id]
)
GO


CREATE INDEX IN_Award
ON [Award].[Awards]
(
	[Award_Id]
)
GO



CREATE INDEX IN_Confederation
ON [Confederation].[Confederations]
(
	[Confederation_Id]
)
GO



CREATE INDEX IN_Goal
ON [Player].[Goals]
(
	 [Goal_Id]	
    ,[Tournament_Id]
	,[Match_Id]
	,[Team_Id]
	,[Player_Id]
	,[Player_Team_Id]

)
GO



CREATE INDEX IN_Group
ON [Group].[Groups]
(
	[Tournament_Id]
)
GO



CREATE INDEX IN_Managers
ON [Manager].[Managers]
(
	[Manager_Id]
)
GO



CREATE INDEX IN_Matches
ON [Match].[Matches]
(
	 [Tournament_Id]
	,[Match_Id]
	,[Stadium_Id]
	,[Home_Team_Id]
	,[Away_Team_Id]
)
GO



CREATE INDEX IN_Referee
ON [Referee].[Referees]
(
	[Referee_Id]
   ,[Confederation_Id]
)
GO



CREATE INDEX IN_Squad
ON [Team].[Squads]
(
	[Tournament_Id]
)
GO



CREATE INDEX IN_Team
ON [Team].[Teams]
(
	[Team_Id]
   ,[Confederation_Id]
)
GO



CREATE INDEX IN_Tournament
ON [Tournament].[Tournaments]
(
	[Tournament_Id]
)
GO



