--Update a table

UPDATE SalesLT.CallLog
SET Notes= 'No Notes'
Where Notes IS NULL;


SELECT * 
FROM SalesLT.CallLog;

SELECT * 
FROM SalesLT.Customer;


--Update multiple columns

UPDATE SalesLT.CallLog
SET SalesPerson = ' ', PhoneNumber = ' ';

--Update from results of a query

UPDATE SalesLT.CallLog 
SET SalesPerson = C.SalesPerson, PhoneNumber = C.Phone
FROM SalesLT.Customer AS C
WHERE C.CustomerID = SalesLT.CallLog.CustomerID;

--Delete rows
DELETE FROM SalesLT.CallLog
WHERE CallTime < DATEADD(dd, -7, GETDATE());

--Truncate the table

TRUNCATE TABLE SalesLT.CallLog;

SELECT * 
FROM SalesLT.CallLog;