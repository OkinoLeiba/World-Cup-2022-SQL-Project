-- =============================================
-- Bulk Insert with BCP
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/28/2022
-- Description:	Inserting data with command-line bcp
-- =============================================


USE [WorldCup2022];
GO

--Create schema
--CREATE SCHEMA [Tournament] AUTHORIZATION dbo;
--GO


-- Drop the table if it already exists
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Tournament].[Tournaments]',N'U'))
DROP TABLE [Tournament].[Tournaments]
GO


CREATE TABLE [Tournament].[Tournaments] (
[Key_Id_Tournament] INT,
    [Tournament_Id] VARCHAR(7),
    [Tournament_Name] VARCHAR(19),
    [Year] INT,
    [Start_Date] DATE,
    [End_Date] DATE,
    [Host_Country] VARCHAR(13),
    [Winner] VARCHAR(12),
    [Host_Won] CHAR,
    [Count_Teams] CHAR,
    [Group_Stage] CHAR,
    [Second_Group_Stage] CHAR,
    [Final_Round] CHAR,
    [Round_Of_16] CHAR,
    [Quarter_Finals] CHAR,
    [Semi_Finals] CHAR,
    [Third_Place_Match] CHAR,
    [Final] CHAR
CONSTRAINT [PK_Key_Id_Tournament]  PRIMARY KEY NONCLUSTERED
(
[Key_Id_Tournament] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = NONE) ON [PRIMARY]
) ON [PRIMARY]
GO

--Bulk insert data into table
BULK INSERT [Tournament].[Tournaments]
FROM 'C:\Users\Owner\source\repos\worldcup\data-csv\tournaments.csv'
WITH 
(BATCHSIZE = 1500,
CODEPAGE = 'OEM',
--DATAFILETYPE 'CHAR',
ERRORFILE = 'C:\Users\Owner\Documents\SQL Server Management Studio\worldcup_proj\worldcup_proj\batch_insert_errorfile-tournaments.txt',
FIRSTROW = 1,
KEEPIDENTITY,
KEEPNULLs,
MAXERRORS = 10,
ORDER ([Key_Id_Tournament] ASC),
ROWS_PER_BATCH = 2000,
TABLOCK,
--FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',

FORMAT = 'CSV')

--Confirm insert
SELECT * FROM [WorldCup2022].[Tournament].[Tournaments];
GO



--bcp WorldCup2022.Tournament.Tournaments in C:\Users\Owner\source\repos\worldcup\data-csv\tournaments.csv -a 8096 -b 50 -C ACP -e C:\worldcup_proj\worldcup_proj\bcp_insert_errorfile-tournament.txt -F 1 -hint 'TABLOCK' -l 5000  -m 10 -q -r 0x0a -S .\SQLSERVER2015

--bcp WorldCup2022.Tournament.Tournaments in C:\Users\Owner\source\repos\worldcup\data-csv\tournaments.csv -S CAPTAINFANTASTI -T -q -c -t -C ACP -F 1 -r \n -hint 'TABLOCK' -l 5000  -m 10 -r 0x0a 


USE [WorldCup2022];
GO

--Create schema
--CREATE SCHEMA [Tournament] AUTHORIZATION dbo;
--GO


-- Drop the table if it already exists
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Tournament].[Tournaments]',N'U'))
DROP TABLE [Tournament].[Tournaments]
GO

CREATE TABLE [Tournament].[Tournaments] (
    [Key_Id_Tournament] INT,
    [Tournament_Id] VARCHAR(7),
    [Tournament_Name] VARCHAR(19),
    [Year] INT,
    [Start_Date] DATE,
    [End_Date] DATE,
    [Host_Country] VARCHAR(13),
    [Winner] VARCHAR(12),
    [Host_Won] CHAR,
    [Count_Teams] CHAR,
    [Group_Stage] CHAR,
    [Second_Group_Stage] CHAR,
    [Final_Round] CHAR,
    [Round_Of_16] CHAR,
    [Quarter_Finals] CHAR,
    [Semi_Finals] CHAR,
    [Third_Place_Match] CHAR,
    [Final] CHAR
	CONSTRAINT [PK_Key_Id_Tournament]  PRIMARY KEY NONCLUSTERED
(
[Key_Id_Tournament] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = NONE) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [Tournament].[Tournaments] VALUES 
	(1,N'WC-1930',N'1930 FIFA World Cup',1930,'1930-07-13 00:00:00','1930-07-30 00:00:00',N'Uruguay',N'Uruguay',1,13,1,0,0,0,0,1,0,1),
	(2,N'WC-1934',N'1934 FIFA World Cup',1934,'1934-05-27 00:00:00','1934-06-10 00:00:00',N'Italy',N'Italy',1,16,0,0,0,1,1,1,1,1),
	(3,N'WC-1938',N'1938 FIFA World Cup',1938,'1938-06-04 00:00:00','1938-06-19 00:00:00',N'France',N'Italy',0,15,0,0,0,1,1,1,1,1),
	(4,N'WC-1950',N'1950 FIFA World Cup',1950,'1950-06-24 00:00:00','1950-07-16 00:00:00',N'Brazil',N'Uruguay',0,13,1,0,1,0,0,0,0,0),
	(5,N'WC-1954',N'1954 FIFA World Cup',1954,'1954-06-16 00:00:00','1954-07-04 00:00:00',N'Switzerland',N'West Germany',0,16,1,0,0,0,1,1,1,1),
	(6,N'WC-1958',N'1958 FIFA World Cup',1958,'1958-06-08 00:00:00','1958-06-29 00:00:00',N'Sweden',N'Brazil',0,16,1,0,0,0,1,1,1,1),
	(7,N'WC-1962',N'1962 FIFA World Cup',1962,'1962-05-30 00:00:00','1962-07-17 00:00:00',N'Chile',N'Brazil',0,16,1,0,0,0,1,1,1,1),
	(8,N'WC-1966',N'1966 FIFA World Cup',1966,'1966-07-11 00:00:00','1966-07-30 00:00:00',N'England',N'England',1,16,1,0,0,0,1,1,1,1),
	(9,N'WC-1970',N'1970 FIFA World Cup',1970,'1970-05-31 00:00:00','1970-06-21 00:00:00',N'Mexico',N'Brazil',0,16,1,0,0,0,1,1,1,1),
	(10,N'WC-1974',N'1974 FIFA World Cup',1974,'1974-06-13 00:00:00','1974-07-07 00:00:00',N'West Germany',N'West Germany',1,16,1,1,0,0,0,0,1,1),
	(11,N'WC-1978',N'1978 FIFA World Cup',1978,'1978-06-01 00:00:00','1978-06-25 00:00:00',N'Argentina',N'Argentina',1,16,1,1,0,0,0,0,1,1),
	(12,N'WC-1982',N'1982 FIFA World Cup',1982,'1982-06-13 00:00:00','1982-07-11 00:00:00',N'Spain',N'Italy',0,24,1,1,0,0,0,1,1,1),
	(13,N'WC-1986',N'1986 FIFA World Cup',1986,'1986-05-31 00:00:00','1986-06-29 00:00:00',N'Mexico',N'Argentina',0,24,1,0,0,1,1,1,1,1),
	(14,N'WC-1990',N'1990 FIFA World Cup',1990,'1990-06-08 00:00:00','1990-07-08 00:00:00',N'Italy',N'West Germany',0,24,1,0,0,1,1,1,1,1),
	(15,N'WC-1994',N'1994 FIFA World Cup',1994,'1994-06-17 00:00:00','1994-07-17 00:00:00',N'United States',N'Brazil',0,24,1,0,0,1,1,1,1,1),
	(16,N'WC-1998',N'1998 FIFA World Cup',1998,'1998-06-10 00:00:00','1998-07-12 00:00:00',N'France',N'France',1,32,1,0,0,1,1,1,1,1),
	(17,N'WC-2002',N'2002 FIFA World Cup',2002,'2002-05-31 00:00:00','2002-06-30 00:00:00',N'Korea, Japan',N'Brazil',0,32,1,0,0,1,1,1,1,1),
	(18,N'WC-2006',N'2006 FIFA World Cup',2006,'2006-06-09 00:00:00','2006-07-09 00:00:00',N'Germany',N'Italy',0,32,1,0,0,1,1,1,1,1),
	(19,N'WC-2010',N'2010 FIFA World Cup',2010,'2010-06-11 00:00:00','2010-07-11 00:00:00',N'South Africa',N'Spain',0,32,1,0,0,1,1,1,1,1),
	(20,N'WC-2014',N'2014 FIFA World Cup',2014,'2014-06-12 00:00:00','2014-07-13 00:00:00',N'Brazil',N'Germany',0,32,1,0,0,1,1,1,1,1),
	(21,N'WC-2018',N'2018 FIFA World Cup',2018,'2018-06-14 00:00:00','2018-07-15 00:00:00',N'Russia',N'France',0,32,1,0,0,1,1,1,1,1);
