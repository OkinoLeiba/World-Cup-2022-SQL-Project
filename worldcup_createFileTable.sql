-- =============================================
-- Create FileTable 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/18/2022
-- Description:	Create a FileTable
-- =============================================

--\\MYSERVER\MSSQLSERVER\WorldCup2022DocumentDatabase\ImportReports

USE [WorldCup2022]
GO

-- Check Whether Non-Transactional Access Is Enabled on Databases
SELECT DB_NAME(database_id) AS database_name, non_transacted_access, non_transacted_access_desc  
    FROM sys.database_filestream_options;  
GO


ALTER DATABASE [WorldCup2022]  
  WITH FILESTREAM (NON_TRANSACTED_ACCESS = FULL, DIRECTORY_NAME = N'ImportReports')



IF OBJECT_ID('[ImportReport].[ImportReports]', 'U') IS NOT NULL
  DROP TABLE [ImportReport].[ImportReports]
GO

CREATE TABLE [ImportReport].[ImportReports] AS FILETABLE
  WITH
  (		
		FileTable_Directory = 'ImportReports',  
        FileTable_Collate_Filename = database_default 
  )
GO


-- View all objects for all filetables, unsorted  
SELECT * FROM sys.filetable_system_defined_objects;  
GO  
  
-- View sorted list with friendly names  
SELECT OBJECT_NAME(parent_object_id) AS 'FileTable', OBJECT_NAME(object_id) AS 'System-defined Object'  
    FROM sys.filetable_system_defined_objects  
    ORDER BY FileTable, 'System-defined Object';  
GO



-- Migrating Files from the File System into a FileTable

-- Add a path locator column to the ImportReports table.  
ALTER TABLE [ImportReport].[ImportReports] ADD PathLocator hierarchyid;  
  
-- Set the root path of the file directory on the File Server.  
DECLARE @UNCPathRoot VARCHAR(100) = '\\source\repos\worldcup\data-csv';  
  
-- Get and Set the root path of the FileTable.  
DECLARE @FileTableRoot VARCHAR(1000);  
SELECT @FileTableRoot = FileTableRootPath('[ImportReport].[ImportReports]');  
  
-- Update the FileMetadata table.  
  
-- Replace the Local File Server UNC path with the FileTable path.  
UPDATE [ImportReport].[ImportReports]  
    SET UNCPath = REPLACE(UNCPath, @UNCPathRoot, @FileTableRoot);  
  
-- Update the pathlocator column to contain the pathlocator IDs from the FileTable.  
UPDATE [ImportReport].[ImportReports]  
    SET PathLocator = GetPathLocator(UNCPath);