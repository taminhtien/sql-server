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

USE AdventureWorks
GO

-- Declare as a table
DECLARE @temp TABLE (
	ContactID int,
	FirstName varchar(100),
	LastName varchar(100),
	EmailAddress varchar(100)
)

INSERT @temp (
	ContactID,
	FirstName,
	LastName,
	EmailAddress
)
SELECT ContactID, FirstName, LastName, EmailAddress
FROM Person.Contact

SELECT * FROM @temp