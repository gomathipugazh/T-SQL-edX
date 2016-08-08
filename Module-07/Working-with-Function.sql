--Table-Valued Functions (TVFs) are functions that return a rowset.
--TVFs can be parameterized

CREATE FUNCTION SalesLT.udfCustomersByCity
(@City AS Varchar(15))
RETURNS TABLE
AS
RETURN
(SELECT C.CustomerID, FirstName, LastName, AddressLine1, City, StateProvince
 FROM SalesLT.Customer AS C 
 INNER JOIN SalesLT.CustomerAddress AS CA
 ON C.CustomerID = CA.CustomerID
 INNER JOIN SalesLT.Address AS A 
 ON CA.AddressID = A.AddressID
 WHERE City = @City);

 --Selecting Table-Valued Function
 SELECT *
 FROM SalesLT.udfCustomersByCity('Bellevue');