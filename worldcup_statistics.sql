-- =============================================
-- Create Fullscan Statistics  
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Full_Players
ON [Player].[Players]
(
   [Key_Id_Players],
   [Player_Id]
) 
WITH FULLSCAN;
GO

-- =============================================
-- Create Fullscan Norecompute Statistics
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
-- Note: Statistics created with NORECOMPUTE are not updated by SQL Server's
-- automatic statistics update feature (auto-stats). Therefore, they many cause
-- suboptimal plans.
CREATE STATISTICS ST_NoReCompute_Player
ON [Player].[Players]
( 
   [Key_Id_Players],
   [Player_Id]
) 
WITH FULLSCAN, NORECOMPUTE;
GO

-- =============================================
--  Create Sampled Statistics 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Sample_Players 
ON [Player].[Players]
( 
   [Key_Id_Players],
   [Player_Id] 
) 
WITH SAMPLE 35 PERCENT;
GO
-- Instead of PERCENT, you can say ROWS to specify the number of rows to sample.


 -- =======================================================================================================================================


-- =============================================
-- Create Fullscan Statistics  
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Full_Teams
ON [Team].[Teams]
(
	[Key_Id_Teams],
	[Team_Id],
    [Confederation_Id]
) 
WITH FULLSCAN;
GO

-- =============================================
-- Create Fullscan Norecompute Statistics
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
-- Note: Statistics created with NORECOMPUTE are not updated by SQL Server's
-- automatic statistics update feature (auto-stats). Therefore, they many cause
-- suboptimal plans.

CREATE STATISTICS ST_NoReCompute_Teams
ON [Team].[Teams]
( 
	[Key_Id_Teams],
	[Team_Id],
	[Confederation_Id]
) 
WITH FULLSCAN, NORECOMPUTE;
GO

-- =============================================
--  Create Sampled Statistics 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Sample_Teams 
ON [Team].[Teams]
( 
	[Key_Id_Teams],
	[Team_Id],
	[Confederation_Id]
) 
WITH SAMPLE 35 PERCENT;
GO
-- Instead of PERCENT, you can say ROWS to specify the number of rows to sample.
  

-- =======================================================================================================================================


-- =============================================
-- Create Fullscan Statistics  
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Full_Awards
ON [Award].[Awards]
(
   [Key_Id_Awards],
   [Award_Id]
) 
WITH FULLSCAN;
GO

-- =============================================
-- Create Fullscan Norecompute Statistics
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
-- Note: Statistics created with NORECOMPUTE are not updated by SQL Server's
-- automatic statistics update feature (auto-stats). Therefore, they many cause
-- suboptimal plans.

CREATE STATISTICS ST_NoReCompute_Awards
ON [Award].[Awards]
( 
   [Key_Id_Awards],
   [Award_Id]
) 
WITH FULLSCAN, NORECOMPUTE;
GO

-- =============================================
--  Create Sampled Statistics 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Sample_Awards 
ON [Award].[Awards]
( 
   [Key_Id_Awards],
   [Award_Id]
) 
WITH SAMPLE 35 PERCENT;
GO
-- Instead of PERCENT, you can say ROWS to specify the number of rows to sample.
 
 
-- =======================================================================================================================================


-- =============================================
-- Create Fullscan Statistics  
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Full_Groups
ON [Group].[Groups]
( 
   [Key_Id_Group],
   [Tournament_Id]
) 
WITH FULLSCAN;
GO

-- =============================================
-- Create Fullscan Norecompute Statistics
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
-- Note: Statistics created with NORECOMPUTE are not updated by SQL Server's
-- automatic statistics update feature (auto-stats). Therefore, they many cause
-- suboptimal plans.

CREATE STATISTICS ST_NoReCompute_Groups
ON [Group].[Groups]
( 
   [Key_Id_Group],
   [Tournament_Id]
) 
WITH FULLSCAN, NORECOMPUTE;
GO

-- =============================================
--  Create Sampled Statistics 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Sample_Groups 
ON [Group].[Groups]
( 
   [Key_Id_Group],
   [Tournament_Id]
   
) 
WITH SAMPLE 35 PERCENT;
GO
-- Instead of PERCENT, you can say ROWS to specify the number of rows to sample.
 
 
-- =======================================================================================================================================


-- =============================================
-- Create Fullscan Statistics  
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Full_Confederations
ON [Confederation].[Confederations]
( 
   [Key_Id_Confederation],
   [Confederation_Id] 
)
WITH FULLSCAN;
GO

-- =============================================
-- Create Fullscan Norecompute Statistics
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
-- Note: Statistics created with NORECOMPUTE are not updated by SQL Server's
-- automatic statistics update feature (auto-stats). Therefore, they many cause
-- suboptimal plans.

CREATE STATISTICS ST_NoReCompute_Confederations
ON [Confederation].[Confederations]
( 
   [Key_Id_Confederation],
   [Confederation_Id]
)
WITH FULLSCAN, NORECOMPUTE;
GO

-- =============================================
--  Create Sampled Statistics 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Sample_Confederations 
ON [Confederation].[Confederations]
( 
   [Key_Id_Confederation],
   [Confederation_Id]  
) 
WITH SAMPLE 35 PERCENT;
GO


-- =======================================================================================================================================



-- =============================================
-- Create Fullscan Statistics  
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Full_Goals
ON [Player].[Goals]
( 
   [Key_Id_Goal],
   [Goal_Id],	
   [Tournament_Id],
   [Match_Id],
   [Team_Id],
   [Player_Id],
   [Player_Team_Id]
)
WITH FULLSCAN;
GO

-- =============================================
-- Create Fullscan Norecompute Statistics
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
-- Note: Statistics created with NORECOMPUTE are not updated by SQL Server's
-- automatic statistics update feature (auto-stats). Therefore, they many cause
-- suboptimal plans.

CREATE STATISTICS ST_NoReCompute_Goals
ON [Player].[Goals]
( 
   [Key_Id_Goal],
   [Goal_Id],	
   [Tournament_Id],
   [Match_Id],
   [Team_Id],
   [Player_Id],
   [Player_Team_Id]
)
WITH FULLSCAN, NORECOMPUTE;
GO

-- =============================================
--  Create Sampled Statistics 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Sample_Goals 
ON [Player].[Goals]
( 
   [Key_Id_Goal],
   [Goal_Id],	
   [Tournament_Id],
   [Match_Id],
   [Team_Id],
   [Player_Id],
   [Player_Team_Id]
) 
WITH SAMPLE 35 PERCENT;
GO


-- =======================================================================================================================================



-- =============================================
-- Create Fullscan Statistics  
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Full_Matches
ON [Match].[Matches]
( 
	[Key_Id_Match],
	[Tournament_Id],
	[Match_Id],
	[Stadium_Id],
	[Home_Team_Id],
	[Away_Team_Id]  
) 
WITH FULLSCAN;
GO

-- =============================================
-- Create Fullscan Norecompute Statistics
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
-- Note: Statistics created with NORECOMPUTE are not updated by SQL Server's
-- automatic statistics update feature (auto-stats). Therefore, they many cause
-- suboptimal plans.

CREATE STATISTICS ST_NoReCompute_Matches
ON [Match].[Matches]
( 
	[Key_Id_Match],
	[Tournament_Id],
	[Match_Id],
	[Stadium_Id],
	[Home_Team_Id],
	[Away_Team_Id]  
) 
WITH FULLSCAN, NORECOMPUTE;
GO

-- =============================================
--  Create Sampled Statistics 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/24/2022
-- Description:	Create statistics to moniter frequently used tables 
-- =============================================
CREATE STATISTICS ST_Sample_Matches 
ON [Match].[Matches]
( 
	[Key_Id_Match],
	[Tournament_Id],
	[Match_Id],
	[Stadium_Id],
	[Home_Team_Id],
	[Away_Team_Id]  
) 
WITH SAMPLE 35 PERCENT;
GO

-- =======================================================================================================================================



-- Instead of PERCENT, you can say ROWS to specify the number of rows to sample.

--<filter_predicate> ::=
--    <conjunct> [AND <conjunct>]
  
--<conjunct> ::=
--    <disjunct> | <comparison>
  
--<disjunct> ::=
--        column_name IN (constant ,...)
  
--<comparison> ::=
--        column_name <comparison_op> constant
  
--<comparison_op> ::=
--    IS | IS NOT | = | <> | != | > | >= | !> | < | <= | !<
    
--<update_stats_stream_option> ::=
--    [ STATS_STREAM = stats_stream ]
--    [ ROWCOUNT = numeric_constant ]
--    [ PAGECOUNT = numeric_contant ]


