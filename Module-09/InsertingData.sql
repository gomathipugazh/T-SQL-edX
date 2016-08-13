--Create a table 

CREATE TABLE SalesLT.CallLog
(
	CallID int IDENTITY PRIMARY KEY NOT NULL,
	CallTime DATETIME NOT NULL DEFAULT GETDATE(),
	SalesPerson nVarchar(256) NOT NULL,
	CustomerID INT NOT NULL REFERENCES SalesLT.Customer(CustomerID),
	PhoneNumber nVarchar(25) NOT NULL,
	Notes nVaRCHAR(Max) NULL
);
GO


--Insert a row
INSERT INTO SalesLT.CallLog
VALUES
('','gomathi',1,'414-345-5670','');



--Select a row

SELECT *
FROM SalesLT.CallLog;

--Inserting Null values

INSERT INTO SalesLT.CallLog
VALUES
(DEFAULT,'gomathi',2,'414-000-5670',NULL);

--Insert a row with explict columns

INSERT INTO SalesLT.CallLog (SalesPerson,CustomerID,PhoneNumber)
VALUES
('gomathi',3,'414-345-0909');


--Insert multiple rows

INSERT INTO SalesLT.CallLog
VALUES
(DATEADD(MI,-2,GETDATE()),'gomathi',4,'232-000-5670',NULL),
(DEFAULT,'gomathi',5,'232-444-5670',NULL);


SELECT *
FROM SalesLT.CallLog;

--Insert the result of a query

INSERT INTO SalesLT.CallLog (SalesPerson, CustomerID, PhoneNumber, Notes)
SELECT SalesPerson, CustomerID, Phone, 'Sales Promotional call'
FROM SalesLT.Customer
WHERE CompanyName = 'Big-Time Bike Store';

SELECT SCOPE_IDENTITY();

--Overriding Identity

SET IDENTITY_INSERT SalesLT.CallLog ON;

INSERT INTO SalesLT.CallLog (CallID,SalesPerson,CustomerID,PhoneNumber)
VALUES
(8,'gomathi',6,'934-990-5678');

SET IDENTITY_INSERT SalesLT.CallLog OFF;






CREATE TABLE TEST 
(
Sno INT NULL ,
Name nVarchar(15) NULL DEFAULT 'ASDF',
Pno INT NOT NULL 
);
GO


SELECT * FROM dbo.TEST

INSERT INTO dbo.TEST
VALUES ('12',DEFAULT,'');

