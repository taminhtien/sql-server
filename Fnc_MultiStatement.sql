USE AdventureWorks
GO

CREATE FUNCTION dbo.fncSplit (
@String nvarchar(4000),
@Delimiter nvarchar(10))
RETURNS @ValueTable TABLE ([value] nvarchar(4000))
BEGIN
	DECLARE @Post int
	DECLARE @Part nvarchar(4000)
	IF RIGHT(@String, 1) <> @Delimiter
		SET @String = @String + @Delimiter
	SET @Post = CHARINDEX(@Delimiter, @String)
	WHILE @Post <> 0
	BEGIN
		SET @Part = SUBSTRING(@String, 1, @Post - 1)
		INSERT INTO @ValueTable ([value]) VALUES (@Part)
		SET @String = SUBSTRING(@String, @Post + 1, LEN(@String))
		SET @Post = CHARINDEX(@Delimiter, @String)
	END
	RETURN
END
GO

SELECT * FROM dbo.fncSplit ('ta minh tien', ' ') 