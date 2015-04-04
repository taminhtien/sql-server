USE tientm
GO

CREATE TABLE dbo.Employee (
	Emp_ID int IDENTITY(1, 1),
	Emp_Name varchar(100),
	Emp_Salary decimal(10, 2)
)

CREATE TABLE dbo.Employee_Audit2 (
	Emp_ID int,
	Emp_Name varchar(100),
	Emp_Salary decimal(10, 2),
	Audit_Action varchar(100),
	Audit_Timestamp datetime
)

INSERT INTO dbo.Employee VALUES ('Anees', 1000)
INSERT INTO dbo.Employee VALUES ('Rick', 1200)
INSERT INTO dbo.Employee VALUES ('John', 1100)
INSERT INTO dbo.Employee VALUES ('Stephan', 1300)
INSERT INTO dbo.Employee VALUES ('Maria', 1400)