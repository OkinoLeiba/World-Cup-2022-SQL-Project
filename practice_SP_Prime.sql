-- =============================================
--  Execute the Stored Procedure 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/15/2022
-- Description:	Simple stored procedure as practice 
-- =============================================
USE [AdventureWorks2019]
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Drop stored procedure if it already exists
IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'sp_Practice' 
)
   DROP PROCEDURE dbo.sp_Practice
GO

CREATE PROCEDURE dbo.sp_Practice
AS
	SELECT CUST.PersonID AS SalesPerson
	, COALESCE(PROD.Name, '') AS Product 
	, COALESCE(PROD.ListPrice, '') AS ListPrice
	, COALESCE(SOH.TotalDue, '') AS TotalDue
	, COALESCE(PROD.StandardCost, '') AS StandardCost
	, COALESCE(SOD.UnitPrice, '') AS UnitPrice
	, COALESCE(SOD.UnitPriceDiscount, '') AS UnitPriceDiscount
	, COALESCE(SOD.OrderQty, '') AS OrderQty
	, COALESCE(SOH.OrderDate, '') AS OrderDate
	, COALESCE(SOH.SalesOrderID, '') AS SalesOrderID
	INTO #TEMP_SALES_CUST
	FROM AdventureWorks2019.Sales.Customer CUST
	LEFT JOIN AdventureWorks2019.Sales.SalesOrderHeader SOH ON CUST.CustomerID = SOH.CustomerID
	LEFT JOIN AdventureWorks2019.Sales.SalesOrderDetail SOD ON SOH.SalesOrderID = SOD.SalesOrderID
	LEFT JOIN AdventureWorks2019.Production.Product PROD ON SOD.ProductID = PROD.ProductID
	WHERE PROD.Name IS NOT NULL; 
GO

-- =============================================
-- Execute the stored procedure
-- =============================================
EXECUTE dbo.sp_Practice
GO


SELECT TEMP.SalesPerson
	,TEMP.Product 
	,TEMP.ListPrice
	,TEMP.TotalDue
	,TEMP.StandardCost
	,TEMP.UnitPrice
	,TEMP.UnitPriceDiscount
	,TEMP.OrderQty
	,TEMP.OrderDate
	,TEMP.SalesOrderID
	,(TEMP.UnitPrice * TEMP.OrderQty) AS TotalCost
FROM #TEMP_SALES_CUST TEMP



-- =============================================
--  Execute the Stored Procedure 
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/15/2022
-- Description:	Simple stored procedure as practice 
-- =============================================
USE [AdventureWorks2019]
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Drop stored procedure if it already exists
IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'sp_PrimeCheck' 
)
   DROP PROCEDURE dbo.sp_PrimeCheck
GO


CREATE PROCEDURE dbo.sp_PrimeCheck (@prime int, @output nvarchar(100) output)
AS
BEGIN
DECLARE @check int = 2 
WHILE (@check < @prime)
BEGIN
	IF (@prime % @check = 0)
		BEGIN
		SET @output = 'Prime Number'
		PRINT 'Prime Number'
		BREAK
		END
	ELSE 
		BEGIN
		SET @output = 'Non Prime Number'
		PRINT 'Prime Number'
		BREAK
		END
	SET @prime +=1
END 
--RETURN @output TSQL RETURN function does not allow for different return types other than int as opposed to some other languages?
RETURN @prime
END
PRINT @output
GO

DECLARE @prime int, @output nvarchar(100)
EXECUTE dbo.sp_PrimeCheck 12, @output OUTPUT
SELECT @prime AS Prime_Number, @output AS Output
GO











 
