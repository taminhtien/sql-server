-- Q1: Write a query that filters data and return the column “Name” from table Production.Product. The filtering of rows is achieved by a WHERE clause that compares a single value from a subquery. The inner subquery shall return a specific ProductSubcategoryID that the outer query uses as a filter of products to include in the report. The inner query will use its own WHERE clause to deliver its value, the ProductSubcategoryID, by retrieving it where the column “Name” in table Production.ProductSubcategory have the value of ‘Saddles’.

SELECT Name
FROM Production.Product
WHERE ProductSubcategoryID IN (
	SELECT ProductSubcategoryID
	FROM Production.ProductSubcategory
	WHERE Name = 'Saddles')
	
-- Q2: In this exercise you can change the previous query to deliver the following result set. The WHERE clause in the subquery will now use the wildcard string ‘Bo%’ for a comparison.

SELECT Name
FROM Production.Product
WHERE ProductSubcategoryID IN (
	SELECT ProductSubcategoryID
	FROM Production.ProductSubcategory
	WHERE Name LIKE 'Bo%')
	
-- Q3
	
SELECT Name
FROM Production.Product
WHERE ListPrice = (
	SELECT MIN(ListPrice)
	FROM Production.Product
	WHERE ProductSubcategoryID = '3')
	
-- Q4-1:

SELECT Name
FROM Person.CountryRegion
WHERE CountryRegionCode IN (
	SELECT CountryRegionCode
	FROM Person.StateProvince
	GROUP BY CountryRegionCode
	HAVING COUNT(*) < 10)
	
-- Q4-2:

SELECT CR.Name
FROM Person.CountryRegion AS CR
JOIN Person.StateProvince AS SP
ON CR.CountryRegionCode = SP.CountryRegionCode
GROUP BY CR.Name, SP.CountryRegionCode
HAVING COUNT(*) < 10
	
-- Q5

SELECT SalesPersonID,
	(SELECT AVG(SubTotal)
	FROM Sales.SalesOrderHeader
	WHERE SalesPersonID IS NOT NULL)
	- AVG(SubTotal) AS SalesDiff
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
GROUP BY SalesPersonID

-- Q6: Find out the average ListPrice value in table Production.Product.
-- Restrict the rows you work on to values 1, 2 and 3 in the column ProductSubcategoryID.

SELECT X.Name, X.Diff
FROM (
	SELECT
		Name,
		ListPrice -
			(SELECT AVG(ListPrice)
			FROM Production.Product
			WHERE ProductSubcategoryID IN (1, 2, 3))
		AS Diff
	FROM Production.Product
	WHERE ProductSubcategoryID IN (1, 2, 3))
	AS X
WHERE Diff BETWEEN -800 AND -400

-- Q7:

SELECT P.FirstName + ' ' + P.LastName AS [Full Name]
FROM Person.Person AS P 
	JOIN HumanResources.Employee AS E
	ON P.BusinessEntityID = E.BusinessEntityID
WHERE 5000 <
    (SELECT Bonus
     FROM Sales.SalesPerson SP
     WHERE SP.BusinessEntityID = E.BusinessEntityID)


	
