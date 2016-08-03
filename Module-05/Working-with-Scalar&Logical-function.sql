--Scalar Function

-- Year function

SELECT YEAR(SellStartDate) AS SellStartYear, ProductID, Name
FROM SalesLT.Product
ORDER BY SellStartYear;

--DateName and Day function

SELECT YEAR(SellStartDate) SellStartYear, DATENAME(mm, SellStartDate) SellStartMonth,SellStartDate,
	   DAY(SellStartDate) SellStartDay, DATENAME(dw, SellStartDate)SellStartWeekday,ProductID, Name
FROM SalesLT.Product
ORDER BY SellStartYear;

--Datediff function

SELECT DATEDIFF(yy, SellStartDate, GETDATE()) YearsSold, ProductID, Name
FROM SalesLT.Product
ORDER BY ProductID;

--Upper function
SELECT UPPER(Name) AS ProductName
FROM SalesLT.Product;

--Concat function
SELECT CONCAT(FirstName + ' ', LastName) AS FullName
FROM SalesLT.Customer;

--LEFT function
SELECT Name, ProductNumber, LEFT(ProductNumber,2) AS ProductType
FROM SalesLT.Product;

--SubString, CharIndex, Len and Reverse function
SELECT Name, ProductNumber, LEFT(ProductNumber,2) AS ProductType, SUBSTRING(ProductNumber, CHARINDEX('-', ProductNumber) +1, 4) AS ModelCode,
			                SUBSTRING(ProductNumber, LEN(ProductNumber) - CHARINDEX('-', REVERSE(RIGHT(ProductNumber, 3))) + 2, 2) AS SizeCode
FROM SalesLT.Product;


--Logical function

SELECT Name, Size AS NumericSize
FROM SalesLT.Product
WHERE ISNUMERIC(SIZE) =1;

--IIF function
SELECT Name, IIF(ProductCategoryID IN (5, 6, 7), 'Bike', 'Other')ProductType, ProductCategoryID
FROM SalesLT.Product;


SELECT Name, IIF(ISNUMERIC(Size) = 1, 'Numeric','Non-Numeric')SizeType, Size
FROM SalesLT.Product; 

SELECT P.Name AS ProductName, PC.Name AS Category, CHOOSE(PC.ProductCategoryID, 'Bikes', 'Components', 'Clothing', 'Accessories','Bikes') AS ProductType, PC.ProductCategoryID
FROM SalesLT.Product AS P
JOIN SalesLT.ProductCategory AS PC
ON P.ProductCategoryID = PC.ProductCategoryID;