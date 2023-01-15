-- =============================================
-- Add Key  
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/18/2022
-- Description:	Adds a PRIMARY KEY constraint to the table
-- =============================================

USE [WorldCup2022]
GO


-- Add a new PRIMARY KEY CONSTRAINT to the table
ALTER TABLE [Award].[Awards]
  ADD CONSTRAINT [PK_Key_Id_Awards] PRIMARY KEY NONCLUSTERED (Key_Id_Awards)
GO


SELECT * FROM sys.objects WHERE type = N'PK';
GO



--IF OBJECT_ID(N'[Award].[Awards]', N'U') IS NOT NULL
--  DROP TABLE[Awards].[Awards]
--GO
