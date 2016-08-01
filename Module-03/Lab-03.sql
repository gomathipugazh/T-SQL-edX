--Challenge 1: Generate Invoice Reports

--1.Retrive Customer Orders

SELECT CompanyName, SalesOrderID, TotalDue 
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS OH
ON C.CustomerID = OH.CustomerID; 

--2.Retrieve customer orders

SELECT CompanyName, SalesOrderID, TotalDue, A.AddressLine1 AS Address, A.City, A.StateProvince AS StateOrProvince, A.CountryRegion AS CountryOrRegion, A.PostalCode    
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS OH
ON C.CustomerID = OH.CustomerID
INNER JOIN SalesLT.CustomerAddress AS CA 
ON C.CustomerID = CA.CustomerID 
INNER JOIN SalesLT.Address AS A
ON CA.AddressID = A.AddressID 
WHERE CA.AddressType = 'Main Office';

--Challenge 2: Retrieve Sales Data

--1.Retrieve a list of all customers and their sales orders

SELECT CompanyName, FirstName + LastName AS Contact, SalesOrderID, TotalDue
FROM SalesLT.Customer AS C
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS OH
ON C.CustomerID = OH.CustomerID 
ORDER BY SalesOrderID DESC;

--2.Retrive a list of customers with no address

SELECT C.CustomerID, C.CompanyName, FirstName + LastName AS ContactName, C.Phone   
FROM SalesLT.Customer AS C
LEFT OUTER JOIN SalesLT.CustomerAddress AS CA 
ON C.CustomerID = CA.CustomerID 
WHERE CA.AddressID IS NULL ;

--3.Retrieve a list of customers and product without orders


SELECT C.CustomerID, P.ProductID
FROM SalesLT.Customer AS C
FULL Outer JOIN SalesLT.SalesOrderHeader AS OH 
ON C.CustomerID = OH.CustomerID
FULL Outer Join SalesLT.SalesOrderDetail AS OD
ON OH.SalesOrderID = OD.SalesOrderID
FULL OUTER JOIN SalesLT.Product AS P
ON OD.ProductID = P.ProductID
WHERE OH.SalesOrderID IS NULL
ORDER BY P.ProductID, C.CustomerID







