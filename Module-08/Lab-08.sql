--Challenge 1: Retrieve Regional Sales Totals

--1.Retrieve totals for country/region and state/province

An existing report uses the following query to return total sales revenue grouped by country/region and state/province.

SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY a.CountryRegion, a.StateProvince
ORDER BY a.CountryRegion, a.StateProvince;

You have been asked to modify this query so that the results include a grand total for all sales revenue 
and a subtotal for each country/region in addition to the state/province subtotals that are already returned.


SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY GROUPING SETS( a.CountryRegion, a.StateProvince, ())
ORDER BY a.CountryRegion, a.StateProvince;


--2.Indicate the grouping level in the result

Modify your query to include a column named Level that indicates at which level in the total, country/region, 
and state/province hierarchy the revenue figure in the row is aggregated.
For example, the grand total row should contain the value ‘Total’, 
the row showing the subtotal for United States should contain the value ‘United States Subtotal’, 
and the row showing the subtotal for California should contain the value ‘California Subtotal’.


SELECT CASE
	   WHEN GROUPING_ID(a.CountryRegion) = 0 THEN a.CountryRegion + 'Subtotal'
	   WHEN GROUPING_ID(a.StateProvince) = 0 THEN  a.StateProvince + 'Subtotal'
	   ELSE  'Total'
	   END AS Total,
	   a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY GROUPING SETS( a.CountryRegion, a.StateProvince, ())
ORDER BY a.CountryRegion, a.StateProvince;


--3.Indicating the grouping level in the results

SELECT CASE
	   WHEN GROUPING_ID(a.CountryRegion) = 0 THEN a.CountryRegion + 'Subtotal'
	   WHEN GROUPING_ID(a.StateProvince) = 0 THEN  a.StateProvince + 'Subtotal'
	   WHEN GROUPING_ID(a.City) = 0 THEN a.City + 'Subtotal'
	   ELSE  'Total'
	   END AS Total,
	   a.CountryRegion, a.StateProvince, a.City, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY GROUPING SETS( a.CountryRegion, a.StateProvince, a.City,())
ORDER BY a.CountryRegion, a.StateProvince;

--Challenge 2:Retrieve Customer Sales Revenue by Category

--1.Retrieve customer sales revenue for each parent category

SELECT * FROM
(SELECT cat.ParentProductCategoryName, cust.CompanyName, sod.LineTotal
 FROM SalesLT.SalesOrderDetail AS sod
 JOIN SalesLT.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
 JOIN SalesLT.Customer AS cust ON soh.CustomerID = cust.CustomerID
 JOIN SalesLT.Product AS prod ON sod.ProductID = prod.ProductID
 JOIN SalesLT.vGetAllCategories AS cat ON prod.ProductcategoryID = cat.ProductCategoryID) AS catsales
PIVOT (SUM(LineTotal) FOR ParentProductCategoryName IN ([Accessories], [Bikes], [Clothing], [Components])) AS pivotedsales
ORDER BY CompanyName;