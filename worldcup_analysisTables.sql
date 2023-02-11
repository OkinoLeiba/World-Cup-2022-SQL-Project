-- =============================================
-- Data analysis 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/25/2022
-- Description:	The tables created to analyze World Cup 2022 data
-- =============================================
USE [WorldCup2022]
GO


SELECT  GS.[Tournament_Id]
	   ,[Group_Name]
	   ,IIF(T.[Winner] = [Team_Name], UPPER([Team_Name]), [Team_Name]) AS Team_Name
	   ,IIF(T.[Winner] = [Team_Name], UPPER(T.[Winner]), T.[Winner]) AS Tournament_Winner
	   ,AVG(CAST([Played] AS INT)) AS Average_Matches_Played
	   ,AVG(TRY_CAST([Wins] AS INT)) AS Average_Wins
	   ,AVG(CAST([Draws] AS INT)) AS Average_Draws
	   ,AVG(TRY_CAST([Losses] AS INT)) AS Average_Losses
	   ,AVG(CAST([Goals_For] AS INT)) AS Average_Goals_For
	   ,AVG(TRY_CAST([Goals_Against] AS INT)) AS Average_Goals_Against
	   ,AVG(CAST([Goal_Difference] AS INT)) AS Average_Goal_Difference
	   ,AVG(TRY_CAST([Points] AS INT)) AS Average_Points
	   ,SUM(CAST([Played] AS INT)) AS Sum_Matches_Played
	   ,SUM(TRY_CAST([Wins] AS INT)) AS Sum_Wins
	   ,SUM(CAST([Draws] AS INT)) AS Sum_Draws
	   ,SUM(TRY_CAST([Losses] AS INT)) AS Sum_Losses
	   ,SUM(CAST([Goals_For] AS INT)) AS Sum_Matches_Goals_For
	   ,SUM(TRY_CAST([Goals_Against] AS INT)) AS Sum_Goals_Against
	   ,SUM(CAST([Goal_Difference] AS INT)) AS Sum_Goal_Difference
	   ,SUM(TRY_CAST([Points] AS INT)) AS Sum_Points
	   ,(CONVERT(INT,[Wins])-AVG(CONVERT(INT,[Wins]))) * (CONVERT(INT,[Points])-AVG(CONVERT(INT,[Points]))) AS COV
	   --,(CONVERT(INT,[Wins])-AVG(CONVERT(INT,[Wins]))) * (CONVERT(INT,[Points])-AVG(CONVERT(INT,[Points]))) / 
	    --STDEVP(CONVERT(INT,[Wins])) * STDEVP(CONVERT(INT,[Points])) AS COEF
		--Divide by Zero
FROM [Group].[Group_Standings] AS GS
LEFT JOIN [Tournament].[Tournaments] AS T
ON GS.[Tournament_Id]=T.[Tournament_Id]
WHERE T.[Winner] = [Team_Name]
GROUP BY GS.[Tournament_Id], [Group_Name],[Team_Name],T.[Winner],[Wins],[Points]
GO

--There is no clear descernable pattern between the statistics presented nor any the staticatical significants of the data to determine a relationship between
--team that won their perspective world cups and matches played, wins, goals scored, or goals allowed.
 

--Which years had the highest and lowest attendance to the World Cup games?

--Which Finals or Semi-final games were decided by penalties?
USE [WorldCup2022]
GO

SELECT [Tournament_Name]
	   ,[Match_Id]
      ,[Match_Name]
      ,[Match_Date]
      ,UPPER([Stage_Name])
	  ,COUNT([Tournament_Id]) OVER(PARTITION BY [Tournament_Id]) AS Penalty_Count
FROM [Match].[Matches]
WHERE [Penalty_Shootout] = '1'
AND UPPER([Stage_Name]) IN ('semi-finals', 'finals')
GO

--No other table contains a penalty shootout column or data indicating games decided by penalties.
SELECT *
FROM [Match].[Matches]
WHERE UPPER([Stage_Name]) = 'finals'
GO


--Which stadium has the max capacity?
USE [WorldCup2022]
GO

SELECT [Stadium_Name]
    ,[Country_Name]
	,[City_Name]
    ,MAX(ALL [Stadium_Capacity]) OVER(PARTITION BY [Country_Name]) AS MAX_Stadium_Capacity
FROM [Stadium].[Stadiums]
ORDER BY [MAX_Stadium_Capacity] DESC
GO


--Who has more wins the home-team or away team?
USE [WorldCup2022]
GO

SELECT DISTINCT UPPER([Result]) AS Home_or_Away
      ,SUM(CAST([Home_Team_Win] AS INT)) OVER(PARTITION BY [Home_Team_Win]) AS Count_Home_Wins
      ,SUM(CAST([Away_Team_Win] AS INT)) OVER(PARTITION BY [Away_Team_Win]) AS Count_Away_Wins
	  ,SUM(CAST([Draw] AS INT)) OVER(PARTITION BY [Draw]) AS Count_Draws
	  ,AVG(CAST([Away_Team_Win] AS INT)) OVER(PARTITION BY [Away_Team_Win]) AS Average_Home_Wins
FROM [Match].[Matches];

USE [WorldCup2022]
GO


DECLARE @count_home INT, @count_away INT, @avg_away INT, @draw INT
SET @count_home = 0;
SET @count_away = 0;
SET @avg_away = 0;
SELECT @count_home = COUNT([Home_Team_Win]) OVER(PARTITION BY [Home_Team_Win]), 
	   @count_away = COUNT([Away_Team_Win]) OVER(PARTITION BY [Away_Team_Win]),
	   @draw = COUNT([Draw]) OVER(PARTITION BY [Draw]),
	   @avg_away = AVG(CAST([Away_Team_Win] AS INT)) OVER(PARTITION BY [Away_Team_Win])
FROM [Match].[Matches];
SELECT @count_home AS N'Home Team Win'
	  ,@count_away AS N'Away Team Win'
	  ,@draw AS N'Draws'
	  ,@avg_away AS N'Average Home Wins';
GO 


--How many countries qualified for the World Cup in 1930 compared to 2014?
USE [WorldCup2022]
GO

SELECT COUNT([Team_Name]) AS Qualified_Countries
FROM [Team].[Qualified_Teams]
WHERE CAST(RIGHT([Tournament_Id], 4) AS INT) BETWEEN 1930 AND 2014
GO


--Count of teams having made the finals.
USE [WorldCup2022]
GO

SELECT DISTINCT [Team_Name]
      ,[Team_Code]
	  ,COUNT([Team_Code]) OVER(PARTITION BY [Team_Code]) AS Total_Count
FROM [Team].[Qualified_Teams]
WHERE [Performance] = 'final'
ORDER BY [Total_Count] DESC
GO



--Sum of substitutions by team outgoing player from the home team
USE [WorldCup2022]
GO


SELECT [Tournament_Name]
      ,[Match_Id]
      ,[Match_Name]
      ,[Match_Date]
      ,UPPER([Stage_Name]) AS Stage_Name
      ,[Group_Name]
      ,[Team_Id]
      ,[Team_Name]
      ,[Team_Code]
      ,[Home_Team]
      ,[Away_Team]
      ,[Minute_Label]
      ,[Minute_Regulation]
      ,UPPER([Match_Period]) AS Match_Period
      ,[Going_Off]
      ,[Coming_On]
	  ,SUM(CAST([Going_Off] AS INT)) OVER(PARTITION BY [Team_Name]) AS SUM_SUBOUT_HOME
FROM [Player].[Substitutions]
WHERE [Going_Off] = 1 AND [Home_Team] = 1
ORDER BY [Tournament_Name]
GO


--Sum of substitutions by team incoming player from the home team
USE [WorldCup2022]
GO


SELECT [Tournament_Name]
      ,[Match_Id]
      ,[Match_Name]
      ,[Match_Date]
      ,UPPER([Stage_Name]) AS Stage_Name
      ,[Group_Name]
      ,[Team_Id]
      ,[Team_Name]
      ,[Team_Code]
      ,[Home_Team]
      ,[Away_Team]
      ,[Minute_Label]
      ,[Minute_Regulation]
      ,UPPER([Match_Period]) AS Match_Period
      ,[Going_Off]
      ,[Coming_On]
	  ,SUM(CAST([Coming_On] AS INT)) OVER(PARTITION BY [Team_Name]) AS SUM_SUBIN_HOME
FROM [Player].[Substitutions]
WHERE [Coming_On] = 1 AND [Home_Team] = 1
ORDER BY [Tournament_Name]
GO


--Sum of substitutions by team outgoing player from the away team
USE [WorldCup2022]
GO


SELECT [Tournament_Name]
      ,[Match_Id]
      ,[Match_Name]
      ,[Match_Date]
      ,UPPER([Stage_Name]) AS Stage_Name
      ,[Group_Name]
      ,[Team_Id]
      ,[Team_Name]
      ,[Team_Code]
      ,[Home_Team]
      ,[Away_Team]
      ,[Minute_Label]
      ,[Minute_Regulation]
      ,UPPER([Match_Period]) AS Match_Period
      ,[Going_Off]
      ,[Coming_On]
	  ,SUM(CAST([Going_Off] AS INT)) OVER(PARTITION BY [Team_Name]) AS SUM_SUBOUT_AWAY
FROM [Player].[Substitutions]
WHERE [Going_Off] = 1 AND [Away_Team] = 1
ORDER BY [Tournament_Name]
GO


--Sum of substitutions by team incoming player from the away team
USE [WorldCup2022]
GO


SELECT [Tournament_Name]
      ,[Match_Id]
      ,[Match_Name]
      ,[Match_Date]
      ,UPPER([Stage_Name]) AS Stage_Name
      ,[Group_Name]
      ,[Team_Id]
      ,[Team_Name]
      ,[Team_Code]
      ,[Home_Team]
      ,[Away_Team]
      ,[Minute_Label]
      ,[Minute_Regulation]
      ,UPPER([Match_Period]) AS Match_Period
      ,[Going_Off]
      ,[Coming_On]
	  ,SUM(CAST([Coming_On] AS INT)) OVER(PARTITION BY [Team_Name]) AS SUM_SUBIN_AWAY
FROM [Player].[Substitutions]
WHERE [Coming_On] = 1 AND [Away_Team] = 1
ORDER BY [Tournament_Name]
GO


--Temp Table: Sum of substitutions by team outgoing player from the home team
USE [WorldCup2022]
GO


SELECT [Tournament_Name]
      ,[Match_Id]
      ,[Match_Name]
      ,[Match_Date]
      ,UPPER([Stage_Name]) AS Stage_Name
      ,[Group_Name]
      ,[Team_Id]
      ,[Team_Name]
      ,[Team_Code]
      ,[Home_Team]
      ,[Away_Team]
      ,[Minute_Label]
      ,[Minute_Regulation]
      ,UPPER([Match_Period]) AS Match_Period
      ,[Going_Off]
      ,[Coming_On]
	  ,SUM(CAST([Going_Off] AS INT)) OVER(PARTITION BY [Team_Name]) AS SUM_SUBOUT_HOME
INTO #SUBOUT_HOME
FROM [Player].[Substitutions]
WHERE [Going_Off] = 1 AND [Home_Team] = 1
ORDER BY [Tournament_Name]
GO


--Temp Table: Sum of substitutions by team incoming player from the home team
USE [WorldCup2022]
GO


SELECT [Tournament_Name]
      ,[Match_Id]
      ,[Match_Name]
      ,[Match_Date]
      ,UPPER([Stage_Name]) AS Stage_Name
      ,[Group_Name]
      ,[Team_Id]
      ,[Team_Name]
      ,[Team_Code]
      ,[Home_Team]
      ,[Away_Team]
      ,[Minute_Label]
      ,[Minute_Regulation]
      ,UPPER([Match_Period]) AS Match_Period
      ,[Going_Off]
      ,[Coming_On]
	  ,SUM(CAST([Coming_On] AS INT)) OVER(PARTITION BY [Team_Name]) AS SUM_SUBIN_HOME
INTO #SUBIN_HOME
FROM [Player].[Substitutions]
WHERE [Coming_On] = 1 AND [Home_Team] = 1
ORDER BY [Tournament_Name]
GO


--Sum of substitutions by team both incoming and outgoing player from the home team
USE [WorldCup2022]
GO


SELECT SO.[Tournament_Name]
      ,SO.[Match_Id]
      ,SO.[Match_Name]
      ,SO.[Match_Date]
      ,SO.[Stage_Name]
      ,SO.[Group_Name]
      ,SO.[Team_Id]
      ,SO.[Team_Name]
      ,SO.[Team_Code]
      ,SO.[Minute_Label]
      ,SO.[Minute_Regulation]
	  ,(SO.[SUM_SUBOUT_HOME] + SI.[SUM_SUBIN_HOME]) AS SUM_HOME
FROM #SUBOUT_HOME AS SO
LEFT JOIN #SUBIN_HOME AS SI
ON SO.[Tournament_Name] = SI.[Tournament_Name]
ORDER BY [SUM_HOME] DESC
GO


--Temp Table: Sum of substitutions by team outgoing player from the away team
USE [WorldCup2022]
GO


SELECT [Tournament_Name]
      ,[Match_Id]
      ,[Match_Name]
      ,[Match_Date]
      ,UPPER([Stage_Name]) AS Stage_Name
      ,[Group_Name]
      ,[Team_Id]
      ,[Team_Name]
      ,[Team_Code]
      ,[Home_Team]
      ,[Away_Team]
      ,[Minute_Label]
      ,[Minute_Regulation]
      ,UPPER([Match_Period]) AS Match_Period
      ,[Going_Off]
      ,[Coming_On]
	  ,SUM(CAST([Going_Off] AS INT)) OVER(PARTITION BY [Team_Name]) AS SUM_SUBOUT_AWAY
INTO #SUBOUT_AWAY
FROM [Player].[Substitutions]
WHERE [Going_Off] = 1 AND [Away_Team] = 1
ORDER BY [Tournament_Name]
GO


--Temp Table: Sum of substitutions by team incoming player from the away team
USE [WorldCup2022]
GO


SELECT [Tournament_Name]
      ,[Match_Id]
      ,[Match_Name]
      ,[Match_Date]
      ,UPPER([Stage_Name]) AS Stage_Name
      ,[Group_Name]
      ,[Team_Id]
      ,[Team_Name]
      ,[Team_Code]
      ,[Home_Team]
      ,[Away_Team]
      ,[Minute_Label]
      ,[Minute_Regulation]
      ,UPPER([Match_Period]) AS Match_Period
      ,[Going_Off]
      ,[Coming_On]
	  ,SUM(CAST([Coming_On] AS INT)) OVER(PARTITION BY [Team_Name]) AS SUM_SUBIN_AWAY
INTO #SUBIN_AWAY
FROM [Player].[Substitutions]
WHERE [Coming_On] = 1 AND [Away_Team] = 1
ORDER BY [Tournament_Name]
GO


--Sum of substitutions by team both outgoing and incoming player from the away team
USE [WorldCup2022]
GO


SELECT SO.[Tournament_Name]
      ,SO.[Match_Id]
      ,SO.[Match_Name]
      ,SO.[Match_Date]
      ,SO.[Stage_Name]
      ,SO.[Group_Name]
      ,SO.[Team_Id]
      ,SO.[Team_Name]
      ,SO.[Team_Code]
      ,SO.[Minute_Label]
      ,SO.[Minute_Regulation]
	  ,(SO.[SUM_SUBOUT_AWAY] + SI.[SUM_SUBIN_AWAY]) AS SUM_AWAY
FROM #SUBOUT_AWAY AS SO
LEFT JOIN #SUBIN_AWAY AS SI
ON SO.[Tournament_Name] = SI.[Tournament_Name]
ORDER BY [SUM_AWAY] DESC 
GO





SELECT SO.[Tournament_Name]
      ,SO.[Match_Id]
      ,SO.[Match_Name]
      ,SO.[Match_Date]
      ,SO.[Stage_Name]
      ,SO.[Group_Name]
      ,SO.[Team_Id]
      ,SO.[Team_Name]
      ,SO.[Team_Code]
      ,SO.[Minute_Label]
      ,SO.[Minute_Regulation]
	  ,(SO.[SUM_SUBOUT_HOME] + SI.[SUM_SUBIN_HOME]) AS SUM_ALL
FROM #SUBOUT_HOME AS SO
LEFT JOIN #SUBIN_HOME AS SI
ON SO.[Tournament_Name] = SI.[Tournament_Name]
UNION
SELECT SO.[Tournament_Name]
      ,SO.[Match_Id]
      ,SO.[Match_Name]
      ,SO.[Match_Date]
      ,SO.[Stage_Name]
      ,SO.[Group_Name]
      ,SO.[Team_Id]
      ,SO.[Team_Name]
      ,SO.[Team_Code]
      ,SO.[Minute_Label]
      ,SO.[Minute_Regulation]
	  ,(SO.[SUM_SUBOUT_AWAY] + SI.[SUM_SUBIN_AWAY]) 
FROM #SUBOUT_AWAY AS SO
LEFT JOIN #SUBIN_AWAY AS SI
ON SO.[Tournament_Name] = SI.[Tournament_Name]
ORDER BY [SUM_ALL] DESC
GO


--Sum of substitutions by team incoming player 
USE [WorldCup2022]
GO


SELECT [Tournament_Name]
      ,[Match_Id]
      ,[Match_Name]
      ,[Match_Date]
      ,UPPER([Stage_Name]) AS Stage_Name
      ,[Group_Name]
      ,[Team_Id]
      ,[Team_Name]
      ,[Team_Code]
      ,[Minute_Label]
      ,[Minute_Regulation]
      ,UPPER([Match_Period]) AS Match_Period
	  ,SUM(CAST([Coming_On] AS INT)) OVER(PARTITION BY [Team_Name]) AS SUM_SUBIN_All
FROM [Player].[Substitutions]
WHERE [Coming_On] = 1 
ORDER BY [SUM_SUBIN_All] DESC
GO


--Sum of substitutions by team outgoing player 
USE [WorldCup2022]
GO


SELECT [Tournament_Name]
      ,[Match_Id]
      ,[Match_Name]
      ,[Match_Date]
      ,UPPER([Stage_Name]) AS Stage_Name
      ,[Group_Name]
      ,[Team_Id]
      ,[Team_Name]
      ,[Team_Code]
      ,[Minute_Label]
      ,[Minute_Regulation]
      ,UPPER([Match_Period]) AS Match_Period
	  ,SUM(CAST([Going_Off] AS INT)) OVER(PARTITION BY [Team_Name]) AS SUM_SUBOUT_All
FROM [Player].[Substitutions]
WHERE [Going_Off] = 1 
ORDER BY [SUM_SUBOUT_All] DESC
GO





--Check for paritial or complete containment
SELECT * 
FROM sys.dm_db_uncontained_entities



SELECT *
FROM sys.dm_db_file_space_usage