--Call each customer once  per product

SELECT P.Name AS ProductName, C.FirstName, C.LastName, C.Phone
FROM SalesLT.Product AS P
CROSS JOIN SalesLT.Customer AS C;