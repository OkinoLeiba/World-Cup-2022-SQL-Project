-- =============================================
-- Add Foreign Key  
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/18/2022
-- Description:	Alter existing table by adding foreign keys
-- =============================================
USE [WorldCup2022]
GO



-- Drop the foreign key if it already exists
IF EXISTS (SELECT * FROM sys.objects WHERE name = N'FK_' AND type = N'F')
ALTER TABLE [Player].[Players]
DROP CONSTRAINT FK_PlayerAward;
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--The Players Ball*
ALTER TABLE [Player].[Players] ADD FK_PlayerAwards VARCHAR(7) NOT NULL FOREIGN KEY (Player_Id) REFERENCES [Award].[Awards] (Player_Id) CHECK (Player_Id LIKE 'P-[0-9]*')
ALTER TABLE [Player].[Players] ADD FK_PlayerAwardWinners VARCHAR(7) NOT NULL FOREIGN KEY (Player_Id) REFERENCES [Award].[Award_Winners] (Player_Id) CHECK (Player_Id LIKE 'P-[0-9]*')
ALTER TABLE [Player].[Players] ADD FK_PlayerBookings VARCHAR(7) NOT NULL FOREIGN KEY (Player_Id) REFERENCES [Player].[Bookings] (Player_Id) CHECK (Player_Id LIKE 'P-[0-9]*')
ALTER TABLE [Player].[Players] ADD FK_PlayerGoals VARCHAR(7) NOT NULL FOREIGN KEY (Player_Id) REFERENCES [Player].[Goals] (Player_Id) CHECK (Player_Id LIKE 'P-[0-9]*')
ALTER TABLE [Player].[Players] ADD FK_PlayerPenalty VARCHAR(7) NOT NULL FOREIGN KEY (Player_Id) REFERENCES [Player].[Penalty_Kicks] (Player_Id) CHECK (Player_Id LIKE 'P-[0-9]*')
ALTER TABLE [Player].[Players] ADD FK_PlayerAppearances VARCHAR(7) NOT NULL FOREIGN KEY (Player_Id) REFERENCES [Player].[Player_Appearances] (Player_Id) CHECK (Player_Id LIKE 'P-[0-9]*')
ALTER TABLE [Player].[Players] ADD FK_PlayerSquads VARCHAR(7) NOT NULL FOREIGN KEY (Player_Id) REFERENCES [Player].[Squads] (Player_Id) CHECK (Player_Id LIKE 'P-[0-9]*')
ALTER TABLE [Player].[Players] ADD FK_PlayerSubstitutions VARCHAR(7) NOT NULL FOREIGN KEY (Player_Id) REFERENCES [Player].[Substitutions] (Player_Id) CHECK (Player_Id LIKE 'P-[0-9]*')

--Ego Candy and Acolades*
ALTER TABLE [Award].[Award] ADD FK_AwardWinners VARCHAR(5) NOT NULL FOREIGN KEY (Award_Id) REFERENCES [Award].[Awards_Winners] (Award_Id) CHECK (Award_Id LIKE 'WC-[0-9]*') 

--Soccer Treking*
ALTER TABLE [Confereation].[Confederations] ADD FK_ConfederationRefAppearances VARCHAR(4) NOT NULL FOREIGN KEY (Confederation_Id)  REFERENCES [Referre].[Referre_Appearances] (Confederation_Id) CHECK (Confederation_Id LIKE 'CF-[0-9]*')
ALTER TABLE [Confereation].[Confederations] ADD FK_ConfederationRefAppointments VARCHAR(4) NOT NULL FOREIGN KEY (Confederation_Id)  REFERENCES [Referre].[Referee_Appointments] (Confederation_Id) CHECK (Confederation_Id LIKE 'CF-[0-9]*')
ALTER TABLE [Confereation].[Confederations] ADD FK_ConfederationRef VARCHAR(4) NOT NULL FOREIGN KEY (Confederation_Id)  REFERENCES [Referre].[Referees] (Confederation_Id) CHECK (Confederation_Id LIKE 'CF-[0-9]*')
ALTER TABLE [Confereation].[Confederations] ADD FK_ConfederationTeams VARCHAR(4) NOT NULL FOREIGN KEY (Confederation_Id)  REFERENCES [Referre].[Teams] (Confederation_Id) CHECK (Confederation_Id LIKE 'CF-[0-9]*')

--I am Group*
ALTER TABLE [Group].[Groups] ADD FK_GroupHost VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Host].[Host_Counrtries] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupManagerApperances VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Manager].[Manager_Apperances] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupManagerAppointments VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Manager].[Manager_Appointments] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupMatches VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Match].[Matches] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupPenalty_Kicks VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Player].[Penalty_Kicks] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupPlayer_Appearances VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Player].[Player_Appearances] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupQualfiedTeams VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Team].[Qualfied_Teams] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupRefAppointments VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Referre].[Referee_Appointments] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupSquads VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Team].[Squads] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupSubstitutions VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Player].[Substitutions] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupTeamAppearances VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Team].[Team_Appearances] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupTournamentStages VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Tournament].[Tournament_Stages] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupTournamentStandings VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Tournament].[Tournament_Standings] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')
ALTER TABLE [Group].[Groups] ADD FK_GroupTournament VARCHAR(7) NOT NULL FOREIGN KEY (Tournament_Id) REFERENCES [Tournament].[Tournaments] (Tournament_Id} CHECK (Tournament_Id LIKE 'WC-[0-9]*')

--I Want to Speak to your...*
ALTER TABLE [Manager].[Managers] ADD FK_ManagerManagerAppointments VARCHAR(5) FOREIGN KEY (Manager_Id) REFERENCES [Manager].[Manager_Appointments] (Manager_Id) CHECK (Manager_Id LIKE 'M-[0-9]*')
ALTER TABLE [Manager].[Managers] ADD FK_ManagerManagerAppearances VARCHAR(5) FOREIGN KEY (Manager_Id) REFERENCES [Manager].[Manager_Appearances] (Manager_Id) CHECK (Manager_Id LIKE 'M-[0-9]*')

--Years End Resolution for the Revolution Game Set and Match*
ALTER TABLE [Match].[Matches] ADD FK_MatchBookings VARCHAR(7) NOT NULL FOREIGN KEY (Match_Id) REFERENCES [Player].[Bookings] (Match_Id) CHECK (Match_Id LIKE 'M-[0-9]*-[0-9]')
ALTER TABLE [Match].[Matches] ADD FK_MatchGoals VARCHAR(7) NOT NULL FOREIGN KEY (Match_Id) REFERENCES [Player].[Goals] (Match_Id) CHECK (Match_Id LIKE 'M-[0-9]*-[0-9]')
ALTER TABLE [Match].[Matches] ADD FK_MatchManagerAppearances VARCHAR(7) NOT NULL FOREIGN KEY (Match_Id) REFERENCES [Manager].[Manager_Appearances] (Match_Id) CHECK (Match_Id LIKE 'M-[0-9]*-[0-9]')
ALTER TABLE [Match].[Matches] ADD FK_MatchPenaltyKicks VARCHAR(7) NOT NULL FOREIGN KEY (Match_Id) REFERENCES [Player].[Penalty_Kicks] (Match_Id) CHECK (Match_Id LIKE 'M-[0-9]*-[0-9]')
ALTER TABLE [Match].[Matches] ADD FK_MatchPlayerAppearances VARCHAR(7) NOT NULL FOREIGN KEY (Match_Id) REFERENCES [Player].[Player_Appearances] (Match_Id) CHECK (Match_Id LIKE 'M-[0-9]*-[0-9]')
ALTER TABLE [Match].[Matches] ADD FK_MatchSubstitutions VARCHAR(7) NOT NULL FOREIGN KEY (Match_Id) REFERENCES [Player].[Substitutions] (Match_Id) CHECK (Match_Id LIKE 'M-[0-9]*-[0-9]')
ALTER TABLE [Match].[Matches] ADD FK_MatchTeamAppearances VARCHAR(7) NOT NULL FOREIGN KEY (Match_Id) REFERENCES [Team].[Team_Appearances] (Match_Id) CHECK (Match_Id LIKE 'M-[0-9]*-[0-9]')

--Blind
ALTER TABLE [Referee].[Referee] ADD FK_RefereeRefAppearance VARCHAR(5) NOT NULL (Referee_Id) REFERENCES [Referee].[Referee_Appearance] (Referee_Id) CHECK (Referee_Id 'R-[0-9]*')
referee_id

--Test Kinda Case: Check to see foreign keys are created in tables
--Determine the user-defined or system-supplied name of the constraint 

SELECT * FROM sys.foreign_keys;
GO

SELECT * FROM sys.foreign_key_columns;
GO

SELECT * FROM sys.check_constraints;
GO

SELECT * FROM sys.default_constraints;
GO

SELECT * FROM sys.key_constraints;
GO


--Drop constraint 
--ALTER TABLE [Player].[Players]
--DROP CONSTRAINT FK_PlayerAward;
--GO