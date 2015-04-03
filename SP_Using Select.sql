USE AdventureWorks
GO

IF OBJECT_ID('HumanResources.uspGetEmployeeByID', 'P') IS NOT NULL
	BEGIN
		DROP PROC HumanResources.uspGetEmployeeByID
		PRINT 'Drop success!'
	END
GO

CREATE PROC HumanResources.uspGetEmployeeByID
@EmployeeID INT
AS
	SET NOCOUNT ON
	SELECT NationalIDNumber,Title, BirthDate, MaritalStatus
	FROM HumanResources.Employee
	WHERE EmployeeID = @EmployeeID
GO

EXEC HumanResources.uspGetEmployeeByID '1'
GO

-- or

EXEC HumanResources.uspGetEmployeeByID @EmployeeID = '2'
GO

-- Declare a variable like table to store output

DECLARE @OutputTable TABLE (
	NationalIDNumber nvarchar(15),
	Title nvarchar(50),
	BirthDate datetime,
	MaritalStatus nchar(1)
)

INSERT @OutputTable
	EXEC HumanResources.uspGetEmployeeByID '1'
SELECT * FROM @OutputTable

-- OR

INSERT @OutputTable
	SELECT NationalIDNumber,Title, BirthDate, MaritalStatus
		FROM HumanResources.Employee
		WHERE EmployeeID = '1'
SELECT * FROM @OutputTable