-- =============================================
-- Create Database 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/15/2022
-- Description:	The table created is used to analyze World Cup 2022 data
-- =============================================
USE master
GO

-- Drop the database if it already exists
IF  EXISTS (
	SELECT name
		FROM sys.databases 
		WHERE name = N'WorldCup2022'
)
DROP DATABASE WorldCup2022
GO


CREATE DATABASE WorldCup2022 
CONTAINMENT = NONE
ON   
PRIMARY
( NAME = WorldCup2022_dat,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WorldCup2022.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )

LOG ON  
( NAME = WorldCup2022_log,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WorldCup2022_log.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB )
COLLATE Latin1_General_100_CI_AS
WITH 
FILESTREAM (NON_TRANSACTED_ACCESS = OFF),  
--DEFAULT_FULLTEXT_LANGUAGE = 1033,
--DEFAULT_LANGUAGE = 1033,
--NESTED_TRIGGERS = ON,
--TRANSFORM_NOISE_WORDS ON,
--TWO_DIGIT_YEAR_CUTOFF = 2050,
DB_CHAINING OFF,
TRUSTWORTHY OFF;
--PERSITENT_LOG_BUFFER ON,
--LEDGER OFF;

GO



USE master
GO
xp_readerrorlog 0, 1, N'Server is listening on' 
GO