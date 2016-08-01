--Challenge 1:Retrieve Customer Addresses

--1.Retrieve billing address

SELECT CompanyName, AddressLine1, City, 'Billing' AS AddressType   
FROM SalesLT.CustomerAddress AS CA, SalesLT.Address AS A, SalesLT.Customer AS C
WHERE C.CustomerID = CA.CustomerID and
	  CA.AddressID = A.AddressID AND
	  AddressType = 'Main Office';

--2.Retrieve shipping address

SELECT CompanyName, AddressLine1, City, 'Shipping' AS AddressType   
FROM SalesLT.CustomerAddress AS CA, SalesLT.Address AS A, SalesLT.Customer AS C
WHERE C.CustomerID = CA.CustomerID AND
	  CA.AddressID = A.AddressID AND
	  AddressType = 'Shipping';

--3.Combine billing and shipping address

SELECT CompanyName, AddressLine1, City, 'Billing' AS AddressType   
FROM SalesLT.CustomerAddress AS CA, SalesLT.Address AS A, SalesLT.Customer AS C
WHERE C.CustomerID = CA.CustomerID and
	  CA.AddressID = A.AddressID AND
	  AddressType = 'Main Office'

UNION ALL

SELECT CompanyName, AddressLine1, City, 'Shipping' AS AddressType   
FROM SalesLT.CustomerAddress AS CA, SalesLT.Address AS A, SalesLT.Customer AS C
WHERE C.CustomerID = CA.CustomerID AND
	  CA.AddressID = A.AddressID AND
	  AddressType = 'Shipping';

--Challenge 2:Filter Customer Addresses

--1.Retrieve customers with only a main office  address

SELECT c.CompanyName
FROM SalesLT.Customer AS c
JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Main Office'
EXCEPT
SELECT c.CompanyName
FROM SalesLT.Customer AS c
JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Shipping'
ORDER BY c.CompanyName;

--2.Retrieve only customers with both a main office address and a shipping address

SELECT c.CompanyName
FROM SalesLT.Customer AS c
JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Main Office'
INTERSECT
SELECT c.CompanyName
FROM SalesLT.Customer AS c
JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Shipping'
ORDER BY c.CompanyName;