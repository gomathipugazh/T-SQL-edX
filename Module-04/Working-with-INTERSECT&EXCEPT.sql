--Intersect

SELECT FirstName, LastName
FROM SalesLT.Customers
INTERSECT 
SELECT FirstName, LastName
FROM SalesLT.Employee

--Except

SELECT FirstName, LastName
FROM SalesLT.Customers
EXCEPT
SELECT FirstName, LastName
FROM SalesLT.Employee