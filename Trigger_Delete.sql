USE tientm
GO

ALTER TRIGGER trgAfterDelete ON dbo.Employee
FOR DELETE
AS
	DECLARE @emp_id int
	DECLARE @emp_name varchar(100)
	DECLARE @emp_salary decimal(10, 2)
	DECLARE @audit_action varchar(100)
	
	SELECT @emp_id = d.Emp_ID FROM deleted d
	SELECT @emp_name = d.Emp_Name FROM deleted d
	SELECT @emp_salary = d.Emp_Salary FROM deleted d
	
	SET @audit_action = 'Delete Record -- After delete trigger'
	
	INSERT INTO dbo.Employee_Audit2
		(Emp_ID, Emp_Name, Emp_Salary, Audit_Action, Audit_Timestamp)
		VALUES (@emp_id, @emp_name, @emp_salary, @audit_action, GETDATE())		
	PRINT 'AFTER DELETE TRIGGER fired'
GO

DELETE dbo.Employee WHERE Emp_ID = '5'

