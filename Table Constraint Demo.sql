-- Table constraint NOT NULL
CREATE TABLE PersonNotNull(
	P_Id int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	HomeAddress varchar(255),
	City varchar(255)
)
GO

-- Test
INSERT INTO PersonNotNull
VALUES(
	1,
	'Tien',
	'Ta',
	'38 Nguyen Tu Nha',
	'TP HCM'
)
GO

INSERT INTO PersonNotNull
VALUES(
	1,
	NULL,
	'Ta',
	NULL,
	'TP HCM'
)
GO

-- UNIQUE Constraint
CREATE TABLE Persons(
	P_Id int NOT NULL UNIQUE,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	HomeAddress varchar(255),
	City varchar(255)
)
GO

-- Test
INSERT INTO Persons
VALUES(
	2,
	'Le',
	'Phu',
	'38 Nguyen Tu Nha',
	'TP HCM'
)
GO

INSERT INTO Persons
VALUES(
	3,
	'Le',
	'Phu',
	'38 Nguyen Tu Nha',
	'TP HCM'
)
GO

-- CHECK Constraint
ALTER TABLE Persons
ADD CONSTRAINT Check_Id CHECK (P_Id > 0)
GO

-- Test
INSERT INTO Persons
VALUES(
	-3,
	'Le',
	'Phu',
	'38 Nguyen Tu Nha',
	'TP HCM'
)
GO

-- PRIMARY KEY Constraint
CREATE TABLE Product(
	ProductID int,
	ProductName nvarchar(50),
	Description nvarchar(100),
	RetailPrice float,
	WholeSalePrice nvarchar(100),
	PRIMARY KEY (ProductID)
)
GO

-- Test
INSERT INTO Product
VALUES(
	NULL,
	'Air Blade',
	'Air Blade 2014',
	42000,
	40000
)
GO

-- FOREIGN KEY Constraint
CREATE TABLE Vendor (
	VendorID int,
	VendorName nvarchar(50),
	Phone varchar(50),
	Website varchar(50),
	ProductID int,
	PRIMARY KEY (VendorID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
)
GO

-- Test
INSERT INTO Vendor
VALUES (
	2,
	'Tien Ta',
	'01675166477',
	'tientm.com.vn',
	2
)
GO

-- DEFAULT Constraint
CREATE TABLE Timesheet (
	PayrollDate datetime,
	WorkingHours int DEFAULT 8
)
GO

-- Test
INSERT INTO Timesheet (PayrollDate)
VALUES (
	'03/27/2015'
)
GO

-- Create Index in Person table
CREATE INDEX PIndex
On Persons (LastName)
GO

-- Create Identity column
CREATE TABLE Customer(
	CustomerID int IDENTITY(1, 1) PRIMARY KEY,
	CustomerName nvarchar(50) NOT NULL,
	ContactName nvarchar(100),
	Address nvarchar(100),
	City nvarchar(50),
	PostalCode nvarchar(50),
	Country nvarchar(50)
)
GO

INSERT INTO Customer
VALUES (
	'Ta Minh Tien',
	'Tien Ta',
	'38 Nguyen Tu Nha',
	'TP HCM',
	'80000',
	'Viet Nam'
)
GO

INSERT INTO Customer
VALUES (
	'Ta Minh Tien',
	'Tien Ta',
	'38 Nguyen Tu Nha',
	'TP HCM',
	'80000',
	'Viet Nam'
)
GO

-- TRUNCATE statement
TRUNCATE TABLE PersonNotNull
GO

-- View demo
-- First, insert data
INSERT INTO Product
VALUES(
	3,
	'Exiter',
	'Exiter 1015',
	62000,
	60000
)
GO

INSERT INTO Product
VALUES(
	4,
	'Suzuki',
	'Suzuki 2015',
	102000,
	90000
)
GO

-- Create new view
CREATE VIEW [Current Product List] AS
	SELECT ProductID, ProductName
	FROM Product
	WHERE WholeSalePrice >= 60000
GO

-- Test
SELECT * FROM [Current Product List]

DROP VIEW [Current Product List]