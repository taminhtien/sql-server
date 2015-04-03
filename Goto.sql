DECLARE @Counter int
SET @Counter = 1
WHILE @Counter < 10
BEGIN
	SELECT @Counter
	SET @Counter = @Counter + 1
	IF @Counter = 4 GOTO Branch_One -- Jumps to the first branch
	IF @Counter = 5 GOTO Branch_Two -- This will never execute
END
Branch_One:
	SELECT 'Jumping to branch one'
	GOTO Branch_Three -- This will prevent Branch_Two executing
Branch_Two:
	SELECT 'Jumping to branch two'
Branch_Three:
	SELECT 'Jumping to branch three'