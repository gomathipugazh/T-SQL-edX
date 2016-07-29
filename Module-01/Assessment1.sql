
--Review Question 1:
--You write a query that returns the Name and Price columns from a table named Product in the Production schema. 
--In the resulting rowset, you want the Name column to be named ProductName.
--Which of the following Transact-SQL statements should you use?

SELECT Name AS ProductName, Price FROM Production.Product;

--Review Question 2:

--You need to retrieve data from a column that is defined as char(1). 
--If the value in the column is a digit between 0 and 9, the query should return it as an integer value. Otherwise, the query should return NULL.
--Which two functions can you use to accomplish this?

--TRY_CAST
--TRY_CONVERT

--Review Question 3:

--You write a Transact-SQL query that returns the Cellphone column from the Sales.Customer table. 
--Cellphone is a varchar column that permits NULL values. For rows where the Cellphone value is NULL, your query should return the text 'None'. 
--Select the correct function to complete the following query:

SELECT FirstName, LastName, ISNULL(Cellphone, 'None') AS Cellphone
FROM Sales.Customer;

 