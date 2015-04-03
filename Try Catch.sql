BEGIN TRY
	-- Generate divide-by-zero error
	DECLARE @var FLOAT
	SET @var = 0
	SELECT 10/@var
END TRY
BEGIN CATCH
	-- Excute error retrieval routine
	SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_STATE() AS ErrorState,
		ERROR_LINE() AS ErrorLine,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage
END CATCH