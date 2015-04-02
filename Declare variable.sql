USE AdventureWorks2008
GO

-- Initialize a variable use 'SET'
DECLARE @FirstName VARCHAR(100)
SET @FirstName = 'Ta Minh Tien'
SELECT @FirstName

-- use 'SELECT'
DECLARE @FirstName VARCHAR(100)
SELECT @FirstName = FirstName FROM Person.Person WHERE BusinessEntityID = '1'
SELECT @FirstName