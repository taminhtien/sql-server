-- Q1: 

SELECT Name
FROM Production.Product
WHERE ProductSubcategoryID IN (
	SELECT ProductSubcategoryID
	FROM Production.ProductSubcategory
	WHERE Name = 'Saddles')
	
-- Q2
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

-- Q6:

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

-- Q8:
-- USE EXISTS

SELECT SP.BusinessEntityID
FROM Sales.SalesPerson SP
WHERE NOT EXISTS
	(SELECT S.SalesPersonID
	FROM Sales.Store S
	WHERE S.SalesPersonID = SP.BusinessEntityID)

-- USE JOIN	

SELECT SP.BusinessEntityID, S.SalesPersonID
FROM Sales.SalesPerson SP
	LEFT JOIN Sales.Store S
		ON SP.BusinessEntityID = S.SalesPersonID
WHERE S.SalesPersonID IS NULL

-- EX2
-- Q1

SELECT CR.Name, PS.Name
FROM Person.CountryRegion CR
	JOIN Person.StateProvince PS
		ON CR.CountryRegionCode = PS.CountryRegionCode

-- Q2:

SELECT CR.Name, PS.Name
FROM Person.CountryRegion CR
	JOIN Person.StateProvince PS
		ON CR.CountryRegionCode = PS.CountryRegionCode
WHERE CR.Name = 'Germany'
	OR CR.Name = 'Canada'
ORDER BY CR.Name

-- Q3

SELECT
	SOH.SalesOrderID,
	CONVERT(VARCHAR(10), SOH.OrderDate, 21)  AS Birthday,
	SOH.SalesPersonID,
	SP.BusinessEntityID,
	SP.Bonus,
	SP.SalesYTD
FROM Sales.SalesOrderHeader SOH
	JOIN Sales.SalesPerson SP
	ON SP.BusinessEntityID = SOH.SalesPersonID
WHERE SOH.SalesPersonID IS NOT NULL
	AND SOH.OnlineOrderFlag != 1
	
-- Q4

SELECT
	SOH.SalesOrderID,
	CONVERT(VARCHAR(10), SOH.OrderDate, 21) AS Birthday,
	E.JobTitle,
	SP.Bonus,
	SP.SalesYTD
FROM Sales.SalesOrderHeader SOH
	JOIN Sales.SalesPerson SP
		ON SP.BusinessEntityID = SOH.SalesPersonID
	JOIN HumanResources.Employee E
		ON E.BusinessEntityID = SP.BusinessEntityID
WHERE SOH.SalesPersonID IS NOT NULL
	AND SOH.OnlineOrderFlag != 1