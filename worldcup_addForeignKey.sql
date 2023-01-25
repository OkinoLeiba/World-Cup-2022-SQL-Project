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
IF EXISTS (SELECT * FROM sys.objects WHERE name = N'FK_' AND type = N'F';
ALTER TABLE [Player].[Players]
DROP CONSTRAINT FK_PlayerAward;
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [Player].[Players] ADD FK_PlayerAward VARCHAR (7) NOT NULL FOREIGN KEY (Player_Id) REFERENCES [Award].[Awards] (Player_Id) CHECK (Player_Id LIKE 'P-[0-9]*')

ALTER TABLE [Team].[Teams] ADD FK_




--Test Case: Check to see foreign keys are created in tables
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