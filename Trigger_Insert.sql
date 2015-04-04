USE tientm
GO

CREATE TRIGGER trgAfterInsert ON dbo.Employee
FOR INSERT
AS
	DECLARE @emp_id int
	DECLARE @emp_name varchar(100)
	DECLARE @emp_salary decimal(10, 2)
	DECLARE @audit_action varchar(100)
	
	SELECT @emp_id = i.Emp_ID FROM inserted i
	SELECT @emp_name = i.Emp_Name FROM inserted i
	SELECT @emp_salary = i.Emp_Salary FROM inserted i
	
	SET @audit_action = 'Inserted Record -- After insert trigger'
	
	INSERT INTO dbo.Employee_Audit2
		(Emp_ID, Emp_Name, Emp_Salary, Audit_Action, Audit_Timestamp)
		VALUES (@emp_id, @emp_name, @emp_salary, @audit_action, GETDATE())
	PRINT 'AFTER TRIGGER fired'		
GO

INSERT INTO dbo.Employee VALUES ('Ta Minh Tien', 2000)



