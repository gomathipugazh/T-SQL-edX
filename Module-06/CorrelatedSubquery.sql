--Self-Contained or Correlated subqueries reference objects in the outer query

SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader AS OH1
ORDER BY CustomerID, OrderDate;


SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader AS OH1
WHERE OrderDate = (SELECT MAX(OrderDate) 
				   FROM SalesLT.SalesOrderHeader)				   
ORDER BY CustomerID, OrderDate;


SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader AS OH1
WHERE OrderDate = (SELECT MAX(OrderDate) 
				   FROM SalesLT.SalesOrderHeader AS OH2
				   WHERE OH2.CustomerID = OH1.CustomerID)
ORDER BY CustomerID, OrderDate;


