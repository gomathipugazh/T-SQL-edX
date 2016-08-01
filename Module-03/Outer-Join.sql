--Get all customers, with sales orders for  those who've bought anything

SELECT C.FirstName, C.LastName, OH.SalesOrderNumber
FROM SalesLT.Customer AS C
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS OH
ON C.CustomerID = OH.CustomerID
ORDER BY C.CustomerID;

--Return only customers who haven't purchased anything

SELECT C.FirstName, C.LastName, OH.SalesOrderNumber
FROM SalesLT.Customer AS C
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS OH
ON C.CustomerID = OH.CustomerID 
WHERE OH.SalesOrderNumber IS NULL
ORDER BY C.CustomerID;

--Multiple tables

SELECT P.Name AS ProductName, OH.SalesOrderNumber
FROM SalesLT.Product AS P
LEFT OUTER JOIN SalesLT.SalesOrderDetail AS OD
ON P.ProductID = OD.ProductID
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS OH
ON OD.SalesOrderID = OH.SalesOrderID
ORDER BY P.ProductID;

--Using both inner join and outer join

SELECT P.Name AS ProductName, OH.SalesOrderNumber
FROM SalesLT.Product AS P
LEFT OUTER JOIN SalesLT.SalesOrderDetail AS OD  --OUTER JOIN
ON P.ProductID = OD.ProductID
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS OH
ON OD.SalesOrderID = OH.SalesOrderID
INNER JOIN SalesLT.ProductCategory AS PC   --INNER JOIN
ON P.ProductCategoryID = PC.ProductCategoryID
ORDER BY P.ProductID;



