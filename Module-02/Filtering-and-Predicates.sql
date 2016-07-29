--Display information about product model 6
SELECT NAME, Color,Size
FROM SalesLT.Product WHERE ProductModelID > 6;

--Display information about product that have product number strats with FR
SELECT ProductNumber, NAME, ListPrice
FROM SalesLT.Product WHERE ProductNumber LIKE 'FR%'; ---For the end use '%FR' & for between '%FR%'

--Filtering the previous query to ensure that the product number contains two sets of two didgets
SELECT Name, ListPrice, ProductNumber 
FROM SalesLT.Product WHERE ProductNumber LIKE 'FR-_[0-9][0-9]_-[0-9][0-9]' 

--Find Products that have no sell end date
SELECT Name 
FROM SalesLT.Product WHERE SellEndDate IS NOT NULL;

--Find Products that have a sell end date in 2006
SELECT Name, SellEndDate
FROM SalesLT.Product WHERE SellEndDate BETWEEN '2006/1/1' AND '2006/12/31';

--Find the Products that have category ID od 5, 6 or 7
SELECT ProductCategoryID, Name, ListPrice 
FROM SalesLT.Product WHERE ProductCategoryID IN (5, 6);



--Find the Products that have category ID od 5, 6 or 7 and have a sell end date
SELECT ProductCategoryID, Name, ListPrice, SellEndDate
FROM SalesLT.Product WHERE ProductCategoryID IN (5, 6, 7) and SellEndDate IS NOT NULL;

--Find the Products that have category ID od 5, 6 or 7 and product number that begins with 'FR'
SELECT ProductCategoryID, Name, ListPrice, ProductNumber
FROM SalesLT.Product WHERE ProductCategoryID IN (5, 6, 7) OR ProductNumber LIKE '%FR';