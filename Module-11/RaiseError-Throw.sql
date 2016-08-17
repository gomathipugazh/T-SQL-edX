--View a system error

INSERT INTO SalesLT.SalesOrderDetail(SalesOrderID, OrderQty, ProductID, Unitprice, UnitPriceDiscount)
VALUES(100000, 1, 680, 1431.50, 0.00);


--Raise an error with RaiseError

UPDATE SalesLT.Product
SET DiscontinuedDate  = GETDATE()
WHERE ProductID = 0;

IF @@ROWCOUNT < 1

RAISERROR('The product is not found - no product have been updated', 16, 0);



--Raise an error with Throw

UPDATE SalesLT.Product
SET DiscontinuedDate  = GETDATE()
WHERE ProductID = 0;

IF @@ROWCOUNT < 1
THROW 50001, 'The product is not found - no product have been updated', 0;