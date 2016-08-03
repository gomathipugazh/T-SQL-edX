--Challenge 1: Retrieve Production Information

--1.Retrieve the name and approximate weight of each product

SELECT CONCAT(ProductID+ ' ', UPPER(Name)) AS Product, ROUND(Weight,0) AS ApproxWeight 
FROM SalesLT.Product;

--2.Retrieve Year and Month in which product were sold first

SELECT CONCAT(ProductID+ ' ', UPPER(Name)) AS Product, ROUND(Weight,0), YEAR(SellStartDate) AS SellStartYear, 
	   DATENAME(mm,SellStartDate) AS SellStartMonth
FROM SalesLT.Product
ORDER BY SellStartYear;

--3.Extract product type from product number

 SELECT CONCAT(ProductID+ ' ', UPPER(Name)) AS Product, ROUND(Weight,0), YEAR(SellStartDate) AS SellStartYear, 
	   DATENAME(mm,SellStartDate) AS SellStartMonth, LEFT(ProductNumber, 2) ProductType
FROM SalesLT.Product
ORDER BY SellStartYear;

--4.Retrieve product with a numeric size

SELECT CONCAT(ProductID+ ' ', UPPER(Name)) AS Product, ROUND(Weight,0), YEAR(SellStartDate) AS SellStartYear, 
	   DATENAME(mm,SellStartDate) AS SellStartMonth, LEFT(ProductNumber, 2) ProductType
FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1
ORDER BY SellStartYear;


--Challenge 2: Rank Customers by Revenue

--1.Retrieve companies ranked by sales totals

SELECT C.CompanyName, TotalDue AS Revenue, RANK()OVER(ORDER BY TotalDue DESC) AS RankBYRevenue
FROM SalesLT.SalesOrderHeader AS OH
INNER JOIN SalesLT.Customer C
ON C.CustomerID = OH.CustomerID
ORDER BY RankBYRevenue;

--Challenge 3: Aggregate Product Sales

--Retrieve total sales by product

SELECT P.Name, Sum(OD.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS OD
INNER JOIN SalesLT.Product AS P
ON P.ProductID = OD.ProductID
GROUP BY P.Name
ORDER BY TotalRevenue DESC;

--2.Filter the product sales list to include only product that cost over $1,000

SELECT P.Name, Sum(OD.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS OD
INNER JOIN SalesLT.Product AS P
ON P.ProductID = OD.ProductID
WHERE ListPrice > 1000
GROUP BY P.Name
ORDER BY TotalRevenue DESC;

--3.Filter the product sales groups to include only total sales over $20,000 

SELECT P.Name, Sum(OD.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS OD
INNER JOIN SalesLT.Product AS P
ON P.ProductID = OD.ProductID
WHERE ListPrice > 1000
GROUP BY P.Name
HAVING Sum(OD.LineTotal) > 20000
ORDER BY TotalRevenue DESC;

