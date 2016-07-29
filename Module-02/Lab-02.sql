--Challenge 1:Retrive Data for Transportation Reports

--1.Retrieve a list of cities

SELECT DISTINCT City, StateProvince
FROM SalesLT.Address;

--2.Retrieve the top 10 heaviest products

SELECT Top 10 PERCENT Name
FROM SalesLT.Product ORDER BY Weight DESC;

--3.Retrieve the top 100 heaviest products by skiping first 10 products

SELECT Name
FROM SalesLT.Product ORDER BY Weight DESC OFFSET 10 ROWS FETCH NEXT 100 ROWS Only;

--Challenge 2: Retrieve Product Data

--1.Retrieve Product details for Product model 1

SELECT Name, Color, Size
FROM SalesLT.Product 
WHERE ProductModelID = 1;

--2.Filter products by color and size
	
SELECT ProductNumber, Name
FROM SalesLT.Product 
WHERE Color IN ('Black','Red','White') AND Size IN ('S','M');

--3.Filter products by product number

SELECT ProductNumber, Name, ListPrice 
FROM SalesLT.Product 
WHERE ProductNumber LIKE 'BK-%';

--4.Retrive specific products by product number

SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product 
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';