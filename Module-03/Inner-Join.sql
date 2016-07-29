--Basic Inner Join

SELECT  SP.Name AS ProductName, SPC.Name AS Category 
FROM SalesLT.Product AS SP 
INNER JOIN SalesLT.ProductCategory AS SPC
ON SP.ProductCategoryID =SPC.ProductCategoryID;

--Inner Join more than two tables
SELECT OH.OrderDate, OH.SalesOrderNumber, P.Name AS ProductName, OD.OrderQty, OD.UnitPrice, OD.LineTotal
FROM SalesLT.SalesOrderHeader AS OH 
JOIN SalesLT.SalesOrderDetail AS OD
ON OH.SalesOrderID = OD.SalesOrderID
Join SalesLT.Product AS P
ON OD.ProductID = P.ProductID
ORDER BY OH.OrderDate, OH.SalesOrderID, OD.SalesOrderDetailID;

--Multiple Join with Predicates

SELECT OH.OrderDate, OH.SalesOrderNumber, P.Name AS ProductName, OD.OrderQty, OD.UnitPrice, OD.LineTotal
FROM SalesLT.SalesOrderHeader AS OH 
JOIN SalesLT.SalesOrderDetail AS OD
ON OH.SalesOrderID = OD.SalesOrderID
Join SalesLT.Product AS P
ON OD.ProductID = P.ProductID AND OD.UnitPrice = P.ListPrice
ORDER BY OH.OrderDate, OH.SalesOrderID, OD.SalesOrderDetailID;
