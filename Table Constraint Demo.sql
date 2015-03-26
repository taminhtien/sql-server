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