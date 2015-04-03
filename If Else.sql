USE AdventureWorks
GO

SELECT EmployeeID, Gender
FROM HumanResources.Employee
WHERE EmployeeID < 100

DECLARE @Gender NCHAR(1)
SELECT @Gender = Gender
FROM HumanResources.Employee
WHERE EmployeeID = 7

IF (RTRIM(@Gender) = 'M')
	PRINT 'This is a man'
ELSE
	PRINT 'This is a woman'