USE AdventureWorks
GO

IF OBJECT_ID('Sales.uspGetSalesYTD4', 'P') IS NOT NULL
	DROP PROC Sales.uspGetSalesYTD4
GO

CREATE PROC Sales.uspGetSalesYTD4
@SalesPerson nvarchar(50) = NULL, -- default value
@SalesYTD money = NULL OUTPUT
AS
	-- Validate the @SalesPerson Parameter
	BEGIN
		IF @SalesPerson IS NULL
			BEGIN
				-- PRINT 'ERROR: You must specify a last name for the sales person'
				RETURN (1)
			END
		ELSE
			BEGIN
			-- Make sure the value is valid
			IF (SELECT COUNT(*)
				FROM HumanResources.vEmployee
				WHERE LastName = @SalesPerson) = 0
				RETURN (2)
			END
	END	
		
	-- Get the sales for the specified name and
	-- assign it to the output parameter

	SELECT @SalesYTD = SalesYTD
	FROM HumanResources.vEmployee E
		JOIN Sales.SalesPerson SP
			ON E.EmployeeID = SP.SalesPersonID
	WHERE E.LastName = @SalesPerson

	-- Check for SQL Server errors
	IF @@ERROR <> 0
		BEGIN
			RETURN (3)
		END
	ELSE
		BEGIN
			-- Check to see if the SalesYDT value is NULL
			IF @SalesYTD IS NULL
				RETURN (4)
			ELSE
				RETURN (0)
		END
GO

-- Declare a variable to receive the output value and return code
-- of the procedure

DECLARE @SalesYDTForSalesPerson money, @ret_code int

-- Execute procedure with a title_id value
-- and save  the output value and return code in variables

EXEC @ret_code = Sales.uspGetSalesYTD4
	'Blythe',
	@SalesYTD = @SalesYDTForSalesPerson OUTPUT
	
	IF @ret_code = 0
	BEGIN
		PRINT 'Procedure executed successfully'
		PRINT 'Year-to-day sales for this employee is '
		+ convert(varchar(10), @SalesYDTForSalesPerson) -- Need to covert to a sequence of characters
	END
	ELSE IF @ret_code = 1
		PRINT 'ERROR: You must specify a last name for the sales person'
	ELSE IF @ret_code = 2
		PRINT 'ERROR: You must enter a valid last name for the sales person'
	ELSE IF @ret_code = 3
		PRINT 'ERROR: An error occurred getting sales value'
	ELSE IF @ret_code = 4
		PRINT 'ERROR: No sales recorded for this employee'
GO