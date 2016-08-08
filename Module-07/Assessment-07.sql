--Review Question 1:

You write a Transact-SQL script and want to store a rowset in a temporary object that will be automatically deleted. The script will reference the temporary rowset from mulitple queries in the same batch.

Which two types of object can you use to achieve your goals?

 Temporary table
 Table Variable

--Review Question 2:


You write a query that contains a derived table. The derived table should retrieve each product category ID and the count of products in those categories from the Production.Product table. The outer query then joins the derived table to the Production.ProductCategory table to display the product category names and their product counts.

Your outer query looks like this:

SELECT cat.Name AS Category, prd_cnts.ProductCount
FROM Production.ProductCategory AS cat
JOIN
-- (derived table goes here ) --
ON cat.ProductCategoryID = prd_cnts.CategoryID;

Which two of the following derived table definitions can you use to complete the query?

(SELECT ProductCategoryID AS CategoryID, COUNT(ProductID) AS ProductCount
FROM Production.Product
GROUP BY ProductCategoryID) AS prd_cnts

(SELECT ProductCategoryID AS CategoryID, COUNT(ProductID) AS ProductCount
FROM Production.Product
GROUP BY ProductCategoryID) AS prd_cnts

--Review Question 3:

You write the following query, which uses a common table expression:

____________________________________
AS
(
SELECT MONTH(OrderDate), SalesOrderID
FROM Sales.SalesOrder
WHERE YEAR(OrderDate) = YEAR(GETDATE())
)
SELECT OrderMonth, COUNT(SalesOrderID) AS Orders
FROM YTD_Orders
GROUP BY OrderMonth;

Which line of code is the correct first line for the above query?

 
WITH YTD_Orders (OrderMonth, SalesOrderID) 