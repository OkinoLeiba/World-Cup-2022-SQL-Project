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
   <column_name1, sysname, column1>,
   <column_name2, sysname, column2>
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
   <column_name1, sysname, column1>,
   <column_name2, sysname, column2>
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
   <column_name1, sysname, column1>,
   <column_name2, sysname, column2>
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
   <column_name1, sysname, column1>,
   <column_name2, sysname, column2>
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
   <column_name1, sysname, column1>,
   <column_name2, sysname, column2>
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
   <column_name1, sysname, column1>,
   <column_name2, sysname, column2>
) 
WITH SAMPLE 35 PERCENT;
GO
-- Instead of PERCENT, you can say ROWS to specify the number of rows to sample.
 
 
-- =======================================================================================================================================


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


