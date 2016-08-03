--Aggregate functions

SELECT COUNT(*) AS Product, COUNT(DISTINCT ProductCategoryID) AS Category, AVG(ListPrice)AS  AveragePrice
FROM SalesLT.Product;

SELECT COUNT(P.ProductID) AS BikeModel, AVG(P.ListPrice) AS AveragePrice
FROM SalesLT.Product AS P
JOIN SalesLT.ProductCategory AS PC
ON P.ProductCategoryID = PC.ProductCategoryID
WHERE PC.Name LIKE '%Bikes';

--Group by Aggregate function

SELECT C.SalesPerson, ISNULL(SUM(OH.SubTotal),0.00) SalesRevenue
FROM SalesLT.Customer C
LEFT JOIN SalesLT.SalesOrderHeader OH
ON C.CustomerID = OH.CustomerID
GROUP BY C.SalesPerson
ORDER BY SalesRevenue DESC; 

SELECT C.SalesPerson, CONCAT(C.FirstName + ' ', C.LastName) AS Customer, ISNULL(SUM(OH.SubTotal), 0.00) AS SalesRevenue
FROM SalesLT.Customer C
LEFT JOIN SalesLT.SalesOrderHeader OH
ON C.CustomerID = OH.CustomerID
GROUP BY C.SalesPerson, CONCAT(C.FirstName + ' ', C.LastName)
ORDER BY SalesRevenue DESC, Customer;