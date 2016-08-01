SELECT FirstName, LastName
FROM SalesLT.Employee
UNION
SELECT FirsetName, LastName
FROM SalesLT.Customers
ORDER BY LastName;
