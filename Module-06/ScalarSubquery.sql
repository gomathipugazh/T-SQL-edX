--Scalar Subquery return a single value
--Multi-valued subqueries return a single-column rowset

--Display List of product whose list price is higher than the highest unit price in sales order.

SELECT MAX(UnitPrice) FROM SalesLT.SalesOrderDetail

SELECT *
FROM SalesLT.Product
WHERE ListPrice > (SELECT MAX(UnitPrice) FROM SalesLT.SalesOrderDetail);

SELECT CustomerID
FROM SalesLT.SalesOrderHeader
WHERE CustomerID IN (SELECT CustomerID 
					 FROM SalesLT.Customer
					 WHERE MiddleName IS NOT NULL)
