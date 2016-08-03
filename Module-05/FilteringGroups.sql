--Filtering

SELECT ProductID, SUM(OD.OrderQty) AS Quantity
FROM SalesLT.SalesOrderDetail AS OD
INNER JOIN SalesLT.SalesOrderHeader OH
ON OD.SalesOrderID = OH.SalesOrderID
WHERE YEAR(OH.OrderDate) = 2008
GROUP BY ProductID
Having SUM(OD.OrderQty)>50; --Having is used to filter the result after the aggregate.We cannot use in where bcos it runs before aggregate.