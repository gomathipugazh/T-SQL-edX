--Challenge 1: Retrieve Production Price Information

--1.Retrieve products whose list price is higher than the average Unit price

SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ListPrice > (SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail);

--2.Retrieve products with a list price of $100 or more that have been sold for less than $100

SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE  ProductID IN (SELECT ProductID FROM SalesLT.SalesOrderDetail WHERE UnitPrice < 100  and  ListPrice >= 100);


--3.Retrieve the cost, list price, and average selling price for each product

SELECT ProductID, Name, StandardCost, ListPrice,
	(SELECT AVG(UnitPrice)
	 FROM SalesLT.SalesOrderDetail AS SOD
	 WHERE P.ProductID = SOD.ProductID) AS AvgSellingPrice
FROM SalesLT.Product AS P
ORDER BY P.ProductID;

--4.Retrieve products that have an average selling price that is lower than the cost

SELECT ProductID, Name, StandardCost, ListPrice,
(SELECT AVG(UnitPrice)
 FROM SalesLT.SalesOrderDetail AS SOD
 WHERE P.ProductID = SOD.ProductID) AS AvgSellingPrice
FROM SalesLT.Product AS P
WHERE StandardCost >
(SELECT AVG(UnitPrice)
 FROM SalesLT.SalesOrderDetail AS SOD
 WHERE P.ProductID = SOD.ProductID)
ORDER BY P.ProductID;

--Challenge 2: Retrieve Customer Information

--1.Retrieve customer information for all sales orders

SELECT SalesOrderID, C.CustomerID, FirstName, LastName, TotalDue
FROM SalesLT.SalesOrderHeader OH
CROSS APPLY dbo.ufnGetCustomerInformation(OH.CustomerID) AS C
ORDER BY C.CustomerID;

--2.Retrieve customer address information

SELECT  C.CustomerID, FirstName, LastName, AddressLine1, City
FROM SalesLT.CustomerAddress AS CA
INNER JOIN SalesLT.Address AS A
ON CA.AddressID = A.AddressID
CROSS APPLY dbo.ufnGetCustomerInformation(CA.CustomerID) AS C
ORDER BY C.CustomerID;

SELECT * FROM SalesLT.SalesOrderHeader