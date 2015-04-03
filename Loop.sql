USE AdventureWorks
GO

WHILE (SELECT AVG(ListPrice) FROM Production.Product) < $4000
BEGIN
	PRINT 'Loop';
	UPDATE Production.Product
		SET ListPrice = ListPrice * 2
	IF (SELECT MAX(ListPrice) FROM Production.Product) > $50000
		BREAK
	ELSE
		CONTINUE
	PRINT 'After continue'
END
PRINT 'End while'

-- Compute sum each conponents of a number
DECLARE @i INT
DECLARE @sum int
SET @i = 12356789
SET @sum = 0
WHILE @i != 0
BEGIN
	SET @sum = @sum + (@i % 10)
	SET @i = @i / 10
END
PRINT @sum