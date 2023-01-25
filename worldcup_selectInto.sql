-- =============================================
-- Select Into   
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/18/2022
-- Description:	Copy data from one table to another
-- =============================================


USE [WorldCup2022]
GO

-- Drop the table if it already exists
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Award].[Awards]') AND type in (N'U'))
DROP TABLE [Award].[Awards]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Create the schema
--CREATE SCHEMA [Award] AUTHORIZATION dbo;
--GO

--Create table
CREATE TABLE [Award].[Awards](
	[Key_Id_Awards] [int] NOT NULL,
	[Award_Id] [varchar](5) NULL,
	[Award_Name] [varchar](17) NULL,
	[Award_Description] [varchar](20) NULL,
	[Year_Introduced] [int] NULL,
    CONSTRAINT [PK_Key_Id_Awards] PRIMARY KEY NONCLUSTERED 
(
	[Key_Id_Awards] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [WorldCup2022]
GO

--INSERT INTO [Award].[Awards]
--           ([Key_Id]
--           ,[Award_Id]
--           ,[Award_Name]
--           ,[Award_Description]
--           ,[Year_Introduced])
--     VALUES
--           SELECT "SELECT" [Key_Id]
--			                 ,[Award_Id]
--							 ,[Award_Name]
--							 ,[Award_Description]
--							 ,[Year_Introduced] 
--	  FROM [Awards].[Awards]
----GO

--Copy data from table to table 
SELECT [Key_Id]
	   ,[Award_Id]
	   ,[Award_Name]
	   ,[Award_Description]
	   ,[Year_Introduced] 
INTO [Award].[Awards] FROM [Awards].[Awards]


--Check new table
SELECT [Key_Id]
	   ,[Award_Id]
	   ,[Award_Name]
	   ,[Award_Description]
	   ,[Year_Introduced] 
FROM [Award].[Awards]



-- Drop the table 
DROP TABLE [Awards].[Awards]
GO

--Drop the schema
DROP SCHEMA [Players];
GO

--Check schema table
SELECT * FROM sys.schemas;
GO







