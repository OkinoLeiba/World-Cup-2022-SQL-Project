USE [WorldCup2022]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



SELECT DISTINCT [Key_Id_Player]
      ,P.[Player_Id]
      ,p.[Family_Name]
      ,P.[Given_Name]
	  ,G.[Goal_Id]
	  ,COUNT([Goal_Id]) OVER (PARTITION BY [Goal_Id] ORDER BY [Goal_ID])
      ,UPPER(G.UPPER([Match_Period])) AS Match_Period
	  ,G.[Minute_Label]
	  ,G.[Minute_Regulation]
	  ,G.[Minute_Stoppage]
	  ,G.[Own_Goal]
	  ,G.[Penalty]
	  ,Upper(G.UPPER([Stage_Name])) AS Stage_Name
      ,[Goal_Keeper]
      ,[Defender]
      ,[Midfielder]
      ,[Forward]
FROM [Player].[Players] AS P
INNER JOIN [Player].[Goals] AS G
ON G.Player_Id = P.Player_Id
WHERE [Forward] = '1'
UNION
SELECT DISTINCT [Key_Id_Player]
      ,P.[Player_Id]
      ,p.[Family_Name]
      ,P.[Given_Name]
	  ,G.[Goal_Id]
	  ,COUNT([Goal_Id]) OVER (PARTITION BY [Goal_Id])
      ,UPPER(G.UPPER([Match_Period])) AS Match_Period
	  ,G.[Minute_Label]
	  ,G.[Minute_Regulation]
	  ,G.[Minute_Stoppage]
	  ,G.[Own_Goal]
	  ,G.[Penalty]
	  ,Upper(G.UPPER([Stage_Name])) AS Stage_Name
      ,[Goal_Keeper]
      ,[Defender]
      ,[Midfielder]
      ,[Forward]
FROM [Player].[Players] AS P
INNER JOIN [Player].[Goals] AS G
ON G.Player_Id = P.Player_Id
WHERE [Midfielder] = '1'
UNION
SELECT DISTINCT [Key_Id_Player]
      ,P.[Player_Id]
      ,p.[Family_Name]
      ,P.[Given_Name]
	  ,G.[Goal_Id]
	  ,COUNT(CAST([Goal_Id] AS INT) OVER(PARTITION BY [Goal_Id])
      ,UPPER(G.UPPER([Match_Period])) AS Match_Period
	  ,G.[Minute_Label]
	  ,G.[Minute_Regulation]
	  ,G.[Minute_Stoppage]
	  ,G.[Own_Goal]
	  ,G.[Penalty]
	  ,Upper(G.UPPER([Stage_Name])) AS Stage_Name
      ,[Goal_Keeper]
      ,[Defender]
      ,[Midfielder]
      ,[Forward]
FROM [Player].[Players] AS P
INNER JOIN [Player].[Goals] AS G
ON G.Player_Id = P.Player_Id
WHERE [Defender] = '1'
UNION
SELECT DISTINCT [Key_Id_Player]
      ,P.[Player_Id]
      ,p.[Family_Name]
      ,P.[Given_Name]
	  ,G.[Goal_Id]
	  ,COUNT([Goal_Id]) OVER (PARTITION BY [Goal_Id])
      ,UPPER(G.UPPER([Match_Period])) AS Match_Period
	  ,G.[Minute_Label]
	  ,G.[Minute_Regulation]
	  ,G.[Minute_Stoppage]
	  ,G.[Own_Goal]
	  ,G.[Penalty]
	  ,Upper(G.UPPER([Stage_Name])) AS Stage_Name
      ,[Goal_Keeper]
      ,[Defender]
      ,[Midfielder]
      ,[Forward]
FROM [Player].[Players] AS P
INNER JOIN [Player].[Goals] AS G
ON G.Player_Id = P.Player_Id
WHERE [Goal_Keeper] = '1'
ORDER BY [Key_Id_Player], UPPER([Match_Period]) ASC
GO



SELECT DISTINCT [Key_Id_Player]
    ,P.[Player_Id]
    ,p.[Family_Name]
    ,P.[Given_Name]
	,G.[Goal_Id]
	,COUNT([Goal_Id]) OVER (PARTITION BY [Goal_Id])
    ,UPPER(G.UPPER([Match_Period])) AS Match_Period
	,G.[Minute_Label]
	,G.[Minute_Regulation]
	,G.[Minute_Stoppage]
	,G.[Own_Goal]
	,G.[Penalty]
	,Upper(G.UPPER([Stage_Name])) AS Stage_Name
	--,R.[Referee_Id]
    ,[Goal_Keeper]
    ,[Defender]
    ,[Midfielder]
    ,[Forward]
      
--INTO #TEMPTABLE    
FROM [Player].[Players] AS P
INNER JOIN [Player].[Goals] AS G
ON G.Player_Id = P.Player_Id
--INNER JOIN [Referee].[Referee_Appearances] AS R
--ON R.Match_Id = G.Match_Id
WHERE [Midfielder] = '1'
ORDER BY [Key_Id_Player], UPPER([Match_Period]) ASC
GO

SELECT DISTINCT [Key_Id_Player]
	   ,COUNT([Goal_Id]) OVER (PARTITION BY [Goal_Id])
	   FROM #TEMPTABLE
	   

DROP TABLE #TEMPTABLE
GO








--What's the average number of goals scored per World Cup?
USE [WorldCup2022]
GO

SELECT DISTINCT G.[Tournament_Id]
	   ,IIF(T.[Position] = 1,T.[Team_Name], NULL) AS Winner
	   ,IIF(T.[Position] = 2,T.[Team_Name], NULL) AS Second_Place
	   ,IIF(T.[Position] = 3,T.[Team_Name], NULL) AS Third_Place
	   ,IIF(T.[Position] = 4,T.[Team_Name], NULL) AS Fourth_Place
       ,SUM(CAST([Home_Team] AS INT))  + SUM(CAST([Away_Team] AS INT))
	   ,COUNT([Home_Team]) 

      
FROM [Player].[Goals] AS G
INNER JOIN [Tournament].[Tournament_Standing] AS T
ON G.[Tournament_Id] = T.[Tournament_Id]
GROUP BY G.[Tournament_Id], T.[Position], T.[Team_Name]
ORDER BY G.[Tournament_Id]
GO




SELECT DISTINCT G.[Tournament_Id]
	,CASE WHEN T.[Position] = 1 THEN T.[Team_Name] 
	WHEN T.[Position] = 2 THEN T.[Team_Name]
	WHEN T.[Position] = 3 THEN T.[Team_Name]
	WHEN T.[Position] = 4 THEN T.[Team_Name] END
    ,SUM(CAST([Home_Team] AS INT))  + SUM(CAST([Away_Team] AS INT))
	,COUNT([Home_Team]) 

      
FROM [Player].[Goals] AS G
INNER JOIN [Tournament].[Tournament_Standing] AS T
ON G.[Tournament_Id] = T.[Tournament_Id]
GROUP BY G.[Tournament_Id], T.[Position], T.[Team_Name]
ORDER BY G.[Tournament_Id]
GO



SELECT DISTINCT G.[Tournament_Id]
	,IIF(T.[Position] = 1,T.[Team_Name], IIF(T.[Position] = 2,T.[Team_Name],IIF(T.[Position] = 3,T.[Team_Name], IIF(T.[Position] = 4,T.[Team_Name], NULL))))
	      
	 
    ,SUM(CAST([Home_Team] AS INT))  + SUM(CAST([Away_Team] AS INT))
	,COUNT([Home_Team]) 

      
FROM [Player].[Goals] AS G
INNER JOIN [Tournament].[Tournament_Standing] AS T
ON G.[Tournament_Id] = T.[Tournament_Id]
GROUP BY G.[Tournament_Id], T.[Position], T.[Team_Name]
ORDER BY G.[Tournament_Id]
GO



SELECT   G.[Tournament_Id] AS Tournament_Id
		,T.[Position] AS Winner
		,[Second_Place]
		,[Third_Place]
		,[Fourth_Place]
FROM
(SELECT G.[Tournament_Id]
	   ,IIF(T.[Position] = 1,T.[Team_Name], NULL) AS Winner
	   ,IIF(T.[Position] = 2,T.[Team_Name], NULL) AS Second_Place
	   ,IIF(T.[Position] = 3,T.[Team_Name], NULL) AS Third_Place 
	   ,IIF(T.[Position] = 4,T.[Team_Name], NULL) AS Fourth_Place      
  FROM [Player].[Goals] AS G
  INNER JOIN [Tournament].[Tournament_Standing] AS T
  ON G.[Tournament_Id] = T.[Tournament_Id]
) AS SOURCE_TABLE
PIVOT
(COUNT(G.[Tournament_id]
FOR G.[Tournament_Id] IN ([Winner],[Second_Place],[Third_Place],[Fourth_Place]) AS PIVOT_TABLE




;WITH cte  
as(SELECT ROW_NUMBER() OVER(ORDER BY ASMapid) id,ASMapid,[Description],[Value]   
FROM #Detailnew d  
JOIN #Mapset s ON d.id=s.id  
JOIN #Mapsetvalue v ON s.id=v.ASMapSetid)  
,cte2 as(SELECT * FROM (SELECT id,ASMapid,[Description] FROM cte) c  
PIVOT (MAX([Description]) FOR id IN ([1],[2],[3],[4],  
[5],[6],[7],[8])) p)  
,cte3 as(SELECT * FROM (SELECT id,ASMapid,[Value] FROM cte) c  
PIVOT (MAX([Value]) FOR id IN ([1],[2],[3],[4],  
[5],[6],[7],[8])) p)  
  
SELECT c2.ASMapid,c2.[1] as FitSizeLabel1,c3.[1] as FitSizeValue1,  
c2.[2] as FitSizeLabel2,c3.[2] as FitSizeValue2,  
c2.[3] as SplitSizeLabel1,c3.[3] as SplitSizeValue1,  
c2.[4] as SplitSizeLabel2,c3.[4] as SplitSizeValue2,  
c2.[5] as SearchLabel1,c3.[5] as SearchValue1,  
c2.[6] as SearchLabel2,c3.[6] as SearchValue2,  
c2.[7] as SearchLabel3,c3.[7] as SearchValue3,  
c2.[8] as SearchLabel4,c3.[8] as SearchValue4  
FROM cte2 c2  
JOIN cte3 c3  
ON c2.ASMapid=c3.ASMapid 


USE [WorldCup2022]
GO

WITH CTE_1 AS
(SELECT G.[Tournament_Id],
        T.[Position], T.[Team_Name]
FROM [Player].[Goals] AS G
INNER JOIN [Tournament].[Tournament_Standing] AS T
ON G.[Tournament_Id] = T.[Tournament_Id]
),
CTE_2 AS
(SELECT * FROM (SELECT [Tournament_Id]
	   ,IIF(T.[Position] = 1,T.[Team_Name], NULL) AS Winner
	   ,IIF(T.[Position] = 2,T.[Team_Name], NULL) AS Second_Place
	   ,IIF(T.[Position] = 3,T.[Team_Name], NULL) AS Third_Place
	   ,IIF(T.[Position] = 4,T.[Team_Name], NULL) AS Fourth_Place     
FROM CTE_1) SOURCE_TABLE
PIVOT
(COUNT([Tournament_Id]) FOR [Tournament_Id] IN ([1],[2],[3],  
[4])) PIVOT_TABLE)

SELECT * FROM CTE_2




