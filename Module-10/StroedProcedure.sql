--Create a stored procedure
CREATE PROCEDURE SalesLT.GetProductsByCategory(@CategoryID Int = NULL)
AS
IF @CategoryID IS NULL
	SELECT ProductID, Name, Color, Size, ListPrice
	FROM SalesLT.Product
ELSE
	SELECT ProductID, Name, Color, Size, ListPrice
	FROM SalesLT.Product
	WHERE ProductCategoryID = @CategoryID;


--Execute the Procedure without a parameter

EXEC SalesLT.GetProductsByCategory

--Execute the procedure with a parameter

EXEC SalesLT.GetProductsByCategory 6 