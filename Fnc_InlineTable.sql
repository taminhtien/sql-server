USE AdventureWorks
GO

CREATE FUNCTION dbo.fncInlineTable()
RETURNS TABLE
AS
	RETURN SELECT * FROM Production.Product
	WHERE Name LIKE 'Flat%'
GO

SELECT * FROM dbo.fncInlineTable()