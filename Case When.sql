USE AdventureWorks
GO

SELECT ProductNumber, ProductLine, Name
FROM Production.Product

SELECT
	ProductNumber,
	CASE ProductLine
		WHEN 'R' THEN 'Road'
		WHEN 'M' THEN 'Mountain'
		WHEN 'T' THEN 'Touring'
		WHEN 'S' THEN 'Other sale item'
		ELSE 'Not for sale'
	END Category,
	Name
FROM Production.Product
ORDER BY ProductNumber
GO
