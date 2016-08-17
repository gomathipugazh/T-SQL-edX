--Try & Catch an error

BEGIN TRY
	UPDATE SalesLT.Product
	SET ProductNumber = ProductID / ISNULL(Weight, 0);
END TRY
BEGIN CATCH
	PRINT 'The following error occurred:';
	PRINT ERROR_MESSAGE();
END CATCH;

--Catch and rethrow

BEGIN TRY
	UPDATE SalesLT.Product
	SET ProductNumber = ProductID / ISNULL(Weight, 0);
END TRY
BEGIN CATCH
	PRINT 'The following error occurred:';
	PRINT ERROR_MESSAGE();
	THROW;
END CATCH;


--Catch, log, and throw a custom error

BEGIN TRY
UPDATE SalesLT.Product
SET ProductNumber = ProductID / ISNULL(Weight, 0);
END TRY
BEGIN CATCH
	DECLARE @ErrorLogID AS Int, @ErrorMsg AS Varchar(250);
	EXECUTE dbo.uspLogError @ErrorLogID OUTPUT;
	SET @ErrorMsg = 'The Update failed because of an error. View error #'
					+ CAST(@ErrorLogID AS Varchar)
					+ ' in the error log for details.';
	THROW 50001, @ErrorMsg, 0 ;
END CATCH;

--View error log
SELECT * 
FROM dbo.ErrorLog;


