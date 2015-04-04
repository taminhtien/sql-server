USE tientm
GO

CREATE TRIGGER trgAfterUpdate ON dbo.Employee
FOR UPDATE
AS
	DECLARE @emp_id int
	DECLARE @emp_name varchar(100)
	DECLARE @emp_salary decimal(10, 2)
	DECLARE @emp_salary_old decimal(10, 2)
	DECLARE @audit_action varchar(100)
	
	SELECT @emp_id = i.Emp_ID FROM inserted i
	SELECT @emp_name = i.Emp_Name FROM inserted i
	SELECT @emp_salary = i.Emp_Salary FROM inserted i
	SELECT @emp_salary_old = d.Emp_Salary FROM deleted d
	
	IF @emp_salary < @emp_salary_old
		SET @audit_action = 'Update Decrease Salary -- After update trigger'
	ELSE IF @emp_salary > @emp_salary_old
		SET @audit_action = 'Update Increase Salary -- After update trigger'
	ELSE
		SET @audit_action = 'After update trigger'
	INSERT INTO dbo.Employee_Audit2
		(Emp_ID, Emp_Name, Emp_Salary, Audit_Action, Audit_Timestamp)
		VALUES (@emp_id, @emp_name, @emp_salary, @audit_action, GETDATE())		
	PRINT 'AFTER UPDATE TRIGGER fired'
GO

UPDATE dbo.Employee SET Emp_Salary = Emp_Salary / 1 WHERE Emp_ID = '3'

