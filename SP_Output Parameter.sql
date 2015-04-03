/*
	Get SalesYTD infomation of an employee, look for parameter LastName
	How to do that: build a SP with input is @SalesPerson in order to referenced by LastName later
	And one output to save return result
*/

USE AdventureWorks
GO

-- Check the existence of sp first
IF OBJECT_ID('dbo.uspGetEmployeeSalesYTD', 'P') IS NOT NULL
	DROP PROCEDURE dbo.uspGetEmployeeSalesYTD
GO

CREATE PROCEDURE dbo.uspGetEmployeeSalesYTD
-- ALTER PROCEDURE dbo.uspGetEmployeeSalesYTD alter a procedure
@SalesPerson nvarchar(50),
@SalesYTD money OUTPUT
AS
	SET NOCOUNT ON -- help to improve perfomance
	SELECT @SalesYTD = SalesYTD
	FROM Sales.SalesPerson AS SP
		JOIN HumanResources.vEmployee E
			ON E.EmployeeID = SP.SalesPersonID
	WHERE LastName = @SalesPerson
RETURN
GO

-- Declare the variable to receive the output value of SP
DECLARE @SalesYTDSalesPerson money
-- Execute the procedure specifying a LastName for the input parameter
-- and saving the output value in the variable @SalesYTDSalesPerson
EXECUTE dbo.uspGetEmployeeSalesYTD
	N'Blythe',
	@SalesYTD = @SalesYTDSalesPerson OUTPUT
-- Display the value returned by the procedure
PRINT 'Year-to-day sales for this employee is '
	+ convert(varchar(10), @SalesYTDSalesPerson) -- Need to covert to a sequence of characters
GO