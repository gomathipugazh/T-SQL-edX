/* Search by city using a variable
  Declare and initialize a varible in single statement
 */

DECLARE @City Varchar(20) = 'Toronto'

--Explicitly assigning the variable
SET @City = 'Bellevue'

SELECT FirstName + ' ' + LastName AS [Name], AddressLine1 AS Address, City
FROM SalesLT.Customer AS C
JOIN SalesLT.CustomerAddress AS CA
ON C.CustomerID = CA.CustomerID
JOIN SalesLT.Address AS A
ON CA.AddressID = A.AddressID
Where City = @City;

--Use a variable as an output

DECLARE @Result Money
SELECT @Result = Max(TotalDue)
FROM SalesLT.SalesOrderHeader;

PRINT @Result;
