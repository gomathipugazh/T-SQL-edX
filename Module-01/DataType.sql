--CAST

SELECT CAST(ProductID AS Varchar(5)) + ': ' + Name AS ProductName 
FROM SalesLT.Product;

--COVERT

SELECT CONVERT(Varchar(5), ProductID) + ': ' + Name AS ProductName
FROM SalesLT.Product;

--CONVERT DATES

SELECT SellStartDate, CONVERT(nvarchar(30), SellStartDate) AS ConvertedDate,
		CONVERT(nvarchar(30), SellStartDate, 126) AS ISOFormatDate
FROM SalesLT.Product;

--Try to CAST 

SELECT Name, CAST(Size as Integer) AS NumericSize
FROM SalesLT.Product; --Throw error

SELECT Name, TRY_CAST(Size as Integer) AS NumericSize
FROM SalesLT.Product; --Convert to integer if the type doesn't match return NULL value

