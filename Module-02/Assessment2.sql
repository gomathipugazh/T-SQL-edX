--Review Question 1:
--You write a Transact-SQL query to list the available sizes for products. Each individual size should be listed only once.
--Which query should you use?

SELECT DISTINCT Size FROM Production.Product; SELECT DISTINCT Size FROM Production.Product; - correct

--Review Question 2:
--You write a Transact-SQL query to return the SalesOrderID, OrderDate, and Amount fields for the first 10 sales orders in order of SalesOrderID.
--Which three of the following queries returns the required results?

SELECT TOP 10 SalesOrderID, OrderDate, Amount
FROM Sales.SalesOrder
ORDER BY SalesOrderID;

SELECT SalesOrderID, OrderDate, Amount
FROM Sales.SalesOrder
ORDER BY SalesOrderID
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;

SELECT SalesOrderID, OrderDate, Amount
FROM Sales.SalesOrder
ORDER BY SalesOrderID
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;

--Review Question 3:
--You write a query to return the Name and Price of all products that have a Category value of 2 or 4. 
--You have used the following SELECT query:

SELECT Name, Price
FROM Production.Product

--Which two of the following WHERE clauses can you use to complete the query correctly?

 WHERE Category = 2 OR Category = 4;
 WHERE Category IN (2, 4);