USE AdventureWorks 
GO

CREATE FUNCTION dbo.fnc_fullName2 (
	@firstName varchar(100),
	@lastName varchar(100))
RETURNS VARCHAR(200)
AS
	BEGIN
		DECLARE @fullName varchar(200)
		-- ISNULL('@firstName', '')
		-- NULL -> ''
		-- NOT NULL -> @firstName
		SET @fullName = ISNULL(@firstName, '') + ' ' + ISNULL(@lastName, '')
		RETURN @fullName
	END
GO

-- Use

SELECT dbo.fnc_fullName2(FirstName, LastName) AS FullName
FROM Person.Contact
