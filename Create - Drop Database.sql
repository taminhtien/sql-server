-- Create database
IF EXISTS (
	SELECT name
	FROM sys.databases
	WHERE name = 'tientm'
)
DROP DATABASE tientm
GO

CREATE DATABASE tientm
GO

-- Create schema
CREATE SCHEMA instore
GO