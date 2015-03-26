-- Create new table
CREATE TABLE Employee (
	EmployeeID		int,
	FirstName		nvarchar(100),
	LastName		nvarchar(100),
	AddressDetail	varchar(100),
	City			nvarchar(100),
	Birthday		nvarchar(10),
	IsDeleteFlag	bit
)
GO

-- Add new column
ALTER TABLE Employee
ADD Gender nchar(1)
GO

-- Delete a column
ALTER TABLE Employee
DROP COLUMN IsDeleteFlag
GO

-- Change data type of existing column
ALTER TABLE Employee
ALTER COLUMN Birthday datetime
GO

ALTER TABLE Employee
ALTER COLUMN EmployeeID int NOT NULL
GO

-- Add primary key
ALTER TABLE Employee
ADD CONSTRAINT PK_Table PRIMARY KEY (EmployeeID)
GO