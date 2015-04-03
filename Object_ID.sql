USE AdventureWorks
GO

-- OBJECT_ID 
-- Object_id(): This function is used to get the schema-scoped
-- object identification number in a database object.
-- This function returns an integer value.
SELECT OBJECT_ID('dbo.TestSP') AS ID
SELECT OBJECT_NAME('87671360') AS Name
-- Function usage:
-- OBJECT_ID ( object_name,  [object_type ] )
-- List user-defined, schema-scoped objects
SELECT * FROM sys.objects
-- List of all schema-scoped system objects
SELECT * FROM sys.system_objects
-- UNION of all schema-scoped user-defined objects and system objects
SELECT * FROM sys.all_objects