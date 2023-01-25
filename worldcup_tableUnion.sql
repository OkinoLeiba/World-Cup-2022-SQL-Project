USE [WorldCup2022]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



SELECT [Key_Id_Player]
      ,P.[Player_Id]
      ,p.[Family_Name]
      ,P.[Given_Name]
	  ,G.[Goal_Id]
      ,UPPER(G.[Match_Period]) AS Match_Period
	  ,G.[Minute_Label]
	  ,G.[Minute_Regulation]
	  ,G.[Minute_Stoppage]
	  ,G.[Own_Goal]
	  ,G.[Penalty]
	  ,G.[Stage_Name]
      ,[Goal_Keeper]
      ,[Defender]
      ,[Midfielder]
      ,[Forward]
      
  INTO #TEMPTABLE    
  FROM [Player].[Players] AS P
  INNER JOIN [Player].[Goals] AS G
  ON G.Player_Id = P.Player_Id
  ORDER BY [Key_Id_Player] ASC
GO


SELECT DISTINCT [Key_Id_Player]
	   ,COUNT([Goal_Id]) OVER (PARTITION BY [Goal_Id])
	   FROM #TEMPTABLE
	   

DROP TABLE #TEMPTABLE
GO