--Create a View

CREATE VIEW SalesLT.vCustomerAddress
AS
SELECT C.CustomerID, FirstName, LastName, AddressLine1, City, StateProvince
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.CustomerAddress AS CA
ON C.CustomerID = CA.CustomerID
INNER JOIN SalesLT.Address AS A
ON CA.AddressID = A.AddressID;


---Query the View

SELECT CustomerID, City
FROM SalesLT.vCustomerAddress;

--Join the view to a table

SELECT C.StateProvince, C.City, ISNULL(SUM(S.TotalDue), 0.00) AS Revenue
FROM SalesLT.vCustomerAddress AS C
LEFT JOIN SalesLT.SalesOrderHeader AS S
ON S.CustomerID = C.CustomerID
GROUP BY C.StateProvince, C.City
ORDER BY C.StateProvince, Revenue DESC;