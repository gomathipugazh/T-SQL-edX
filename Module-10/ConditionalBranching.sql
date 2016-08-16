--Simple logical test

IF 'Yes' = 'Yes'
PRINT 'True'

--Change code based on condition

UPDATE SalesLT.Product
SET DiscontinuedDate = GetDate()
WHERE ProductID = 1;

IF @@ROWCOUNT < 1
BEGIN
	PRINT 'Product not found'
END
ELSE
BEGIN
	PRINT 'Product Updated'
END
