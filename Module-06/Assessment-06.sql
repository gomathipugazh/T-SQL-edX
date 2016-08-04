Review Question 1:

The Sales.SalesOrder table contains details of sales orders made by customers. Customers are identified by a unique CustomerID column, which is the primary key of the Sales.Customer table. The Sales.Customer table also contains a City column that contains the name of the city in which the customer lives.

Select the appropriate WHERE clause for the following query so that it returns sales order data for all customers who live in New York:

SELECT SalesOrderID, OrderDate, Amount
FROM Sales.SalesOrder

WHERE CustomerID IN (SELECT CustomerID FROM Sales.Customer WHERE City = 'New York'); 


Review Question 2:

Select the appropriate subquery WHERE predicate to complete the following query so that the OrderCount column contains a count of the orders placed by each customer.

SELECT CustomerID, CompanyName,
 (SELECT COUNT(*) FROM Sales.SalesOrder AS o
  WHERE ___________________________________) AS OrderCount
FROM Sales.Customer AS c;

o.CustomerID = c.CustomerID


Review Question 3:

Your database contains a table-valued function named dbo.fn_CurrentYearOrders that returns the SalesOrderID, OrderDate, and SalesAmount for each order placed in the current year by the customer specified in a CustomerID parameter.

You write the following query to return the CompanyName column from the Sales.Customer table and the sum of revenue for each customer in the current year, and you plan to use the dbo.fn_CurrentYearOrders function to accomplish this. Only data for customers who have placed orders in the current year should be included in the results.

SELECT c.CompanyName, SUM(cyo.SalesAmount) AS Revenue
FROM SalesLT.Customer AS c
_____________________________________________________
GROUP BY c.CompanyName;

Which line of code is the correct one for the query?

CROSS APPLY dbo.fn_CurrentYearOrders(c.CustomerID) AS cyo