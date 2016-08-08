--Challenge 1:Retrieve Product Information

--1.Retrieve product model descriptions

Select * From SalesLT.vProductModelCatalogDescription

SELECT PMC.Name AS ProductModelName, PMC.Summary AS ProductModelSummary, P.ProductID, P.Name ProductName
FROM SalesLT.vProductModelCatalogDescription AS PMC
INNER JOIN SalesLT.Product AS P
ON P.ProductModelID = PMC.ProductModelID
ORDER BY P.ProductID;

--2.Create a table of distinct colors

DECLARE @Colors AS TABLE 
(Color Varchar(15));

--Inserting table variable

INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product;

--Selecting the table variable

SELECT ProductID, Name, P.Color
FROM @Colors AS C
INNER JOIN SalesLT.Product AS P
ON P.Color = C.Color ;


--3.Retrieve product  parent categories

sp_helptext 'dbo.ufnGetAllCategories';

SELECT C.ParentProductCategoryName AS ParentCategory,
       C.ProductCategoryName AS Category,
       P.ProductID, P.Name AS ProductName
FROM SalesLT.Product AS P
JOIN dbo.ufnGetAllCategories() AS C
ON P.ProductCategoryID = C.ProductCategoryID
ORDER BY ParentCategory, Category, ProductName;


--Challenge 2: Retrieve Customer Sales Revenue

 --1.Retrieve sales revenue by customer and contact

 -- Get sales revenue by company and contact (using derived table)
SELECT CompanyContact, SUM(SalesAmount) AS Revenue
FROM
	(SELECT CONCAT(c.CompanyName, CONCAT(' (' + c.FirstName + ' ', c.LastName + ')')), SOH.TotalDue
	 FROM SalesLT.SalesOrderHeader AS SOH
	 JOIN SalesLT.Customer AS c
	 ON SOH.CustomerID = c.CustomerID) AS CustomerSales(CompanyContact, SalesAmount)
GROUP BY CompanyContact
ORDER BY CompanyContact;

-- Get sales revenue by company and contact (using CTE)
WITH CustomerSales(CompanyContact, SalesAmount)
AS
(SELECT CONCAT(c.CompanyName, CONCAT(' (' + c.FirstName + ' ', c.LastName + ')')), SOH.TotalDue
 FROM SalesLT.SalesOrderHeader AS SOH
 JOIN SalesLT.Customer AS c
 ON SOH.CustomerID = c.CustomerID)
SELECT CompanyContact, SUM(SalesAmount) AS Revenue
FROM CustomerSales
GROUP BY CompanyContact
ORDER BY CompanyContact;


