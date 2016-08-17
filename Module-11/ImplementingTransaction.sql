--No Transaction

BEGIN TRY
	INSERT INTO SalesLT.SalesOrderHeader(DueDate, CustomerID, ShipMethod)
	VALUES(DATEADD(dd, 7, GETDATE()), 1, 'STD Delivery');

	DECLARE @SalesOrderID Int  = SCOPE_IDENTITY();

	INSERT INTO SalesLT.SalesOrderDetail(SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
	VALUES(@SalesOrderID, 1, 99999, 1431.50, 0.00);
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE();
END CATCH;

--View orphaned orders

SELECT h.SalesOrderID, h.DueDate, h.CustomerID, h.ShipMethod, d.SalesOrderDetailID
FROM SalesLT.SalesOrderHeader AS h
LEFT JOIN SalesLT.SalesOrderDetail AS d
ON d.SalesOrderID = h.SalesOrderID
WHERE D.SalesOrderDetailID IS NULL;

SELECT Scope_IDENTITY()

--Use Transaction

BEGIN TRY
	BEGIN TRANSACTION
	INSERT INTO SalesLT.SalesOrderHeader(DueDate, CustomerID, ShipMethod)
	VALUES(DATEADD(dd, 7, GETDATE()), 1, 'STD Delivery');

	DECLARE @SalesOrderID Int  = SCOPE_IDENTITY();

	INSERT INTO SalesLT.SalesOrderDetail(SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
	VALUES(@SalesOrderID, 1, 99999, 1431.50, 0.00);
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN 
	PRINT XACT_STATE(); --it print the status of the transaction
	ROLLBACK TRANSACTION;
	END
		PRINT ERROR_MESSAGE();
		THROW 50001, 'An insert failed. The transaction was cancelled.', 0;
END CATCH;

--Use XACT_ABORT- Enable the XACT_ABORT option to automatically rollback all transactions if an exception occurs. 
SET XACT_ABORT ON;
BEGIN TRY
	BEGIN TRANSACTION
	INSERT INTO SalesLT.SalesOrderHeader(DueDate, CustomerID, ShipMethod)
	VALUES(DATEADD(dd, 7, GETDATE()), 1, 'STD Delivery');

	DECLARE @SalesOrderID Int  = SCOPE_IDENTITY();

	INSERT INTO SalesLT.SalesOrderDetail(SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
	VALUES(@SalesOrderID, 1, 99999, 1431.50, 0.00);
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
		PRINT ERROR_MESSAGE();
		THROW 50001, 'An insert failed. The transaction was cancelled.', 0;
END CATCH;
SET XACT_ABORT OFF;