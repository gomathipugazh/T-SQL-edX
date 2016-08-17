Review Question 1

(1/1 point)
You write a stored procedure that updates the price of a product. The product and its new price are specified parameters named @ProductID and @NewPrice. If the specified product does not exist and no rows are affected by the update operation, you want a custom error to be returned to the calling client application.

The partial stored procedure code is shown here:

UPDATE Production.Product
SET ListPrice = @NewPrice
WHERE ProductID = @ProductID;
IF @@ROWCOUNT < 1
-- create an error here

Which two of these statements could you use to achieve the required result.

 THROW 50001, 'Product not found', 0;
 RAISERROR('Product not found', 16, 0);


 Review Question 2

(1/1 point)
You write a stored procedure that transfers funds from one account to another. You use the following code to perform this task:

UPDATE Banking.Account
SET Balance = Balance - @amount
WHERE AccountNumber = @SourceAccount;
UPDATE Banking.Account
SET Balance = Balance + @amount
WHERE AccountNumber = @TargetAccount;

The SET XACT_ABORT option is OFF.

If an error occurs after the second UPDATE statement has started, but before it has completed, what will be the status of the data?


Only source account balance will have been updated.


Review Question 3

(1/1 point)
You write a Transact-SQL script to delete a customer and all of their purchase history. The code must ensure that all relevant records are deleted, or if an error occurs part-way through the operation, that no rows are deleted.

You write the following code:

SET XACT_ABORT ON
BEGIN TRY
 BEGIN TRANSACTION
  DELETE FROM Sales.SalesOrder WHERE CustomerID = @CustomerID;
  DELETE FROM Sales.Customer WHERE CustomerID = @CustomerID;
 _____________
END TRY
BEGIN CATCH
 THROW 50001, 'The operation failed', 0;
END CATCH;
SET XACT_ABORT OFF

Which statement should you use to replace the missing code?

 
COMMIT TRANSACTION 