--Challenge 1: Retrive Customer Data

--1.Retrive customer details
SELECT * FROM SalesLT.Customer;

--2.Retrive customer name data
SELECT Title, FirstName, MiddleName, LastName, Suffix 
FROM SalesLT.Customer;

--3.Retrive customer names and phone numbers
Select SalesPerson, Title + LastName AS CustomerName, Phone
From SalesLT.Customer;

--Challenge 2: Retrive Customer and Sales Data

--1.Retrive a list of customer companies
SELECT CAST(CustomerID AS Varchar(30)) + ': ' + CompanyName 
FROM SalesLT.Customer;

--2.Retrive a list of sales order revisions
SELECT * FROM SalesLT.SalesOrderHeader;

SELECT SalesOrderNumber + ' (' + STR(RevisionNumber,1) + ')' AS SalesOrderNO, CONVERT(nvarchar(30), OrderDate, 102) AS ANSIFormateOrderDate
FROM SalesLT.SalesOrderHeader;

--Challenge 3:Retrive customer contact details

--1.Retrive customer contact names with middle name if known
SELECT FirstName + ' ' + ISNULL(MiddleName,'') +  LastName 
FROM SalesLT.Customer;

--2.Retrive primary contact details
UPDATE SalesLT.Customer
SET EmailAddress = NULL
WHERE CustomerID % 7 = 1;

SELECT CustomerID, COALESCE(EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer;

--3.Retrive shipping status

UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71899;

SELECT SalesOrderID, OrderDate,
		CASE 
		WHEN ShipDate IS NULL THEN 'Awaiting Status'
		ELSE 'Shipped'
		END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;

