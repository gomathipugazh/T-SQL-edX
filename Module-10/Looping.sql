--Create DemoTable  table
CREATE TABLE SalesLT.DemoTable (Description nVarchar(50));

--Loop 

DECLARE @Counter Int = 1
WHILE @Counter < 5

BEGIN
	INSERT SalesLT.DemoTable(Description)
	Values('ROW' +CONVERT(Varchar(5), @Counter))
	SET @Counter = @Counter + 1
END

SELECT Description 
FROM SalesLT.DemoTable;