Question 1

(1/1 point)
The Production.Product table contains a column named Name and a column named Price. You want to write a query that returns the values in these columns. In your resultset, you want the values in the Name column to be returned in a column named ProductName.

Which two of the following SELECT statements can you use?

 SELECT Name AS ProductName, Price FROM Production.Product;
 SELECT Name ProductName, Price FROM Production.Product;


 Question 2

(1/1 point)
The Sales.SalesOrder table contains the following columns:

OrderNumber (integer)
OrderDate (datetime)
CustomerID (integer)
Subtotal (money)
Tax (money)
You write a query to return the OrderNumber for each row and a column named Total, which is calculated as Subtotal added to Tax.

Which of the following queries produces the required results?

 SELECT OrderNumber, Subtotal + Tax AS Total FROM Sales.SalesOrder; SELECT OrderNumber, Subtotal + Tax AS Total FROM Sales.SalesOrder; 


 Question 3

(1/1 point)
The Sales.LineItem table includes the following columns:

ProductID (integer)
Quantity (integer)
Price (varchar(6))
The Price column contains decimal numeric values, for example 14.79.

You write a query that returns each ProductID and a column named Subtotal, in which the values for Quantity and Price are multiplied together.

Which two of the following queries return the correct results?

SELECT ProductID, Quantity * CAST(Price AS money) AS Subtotal FROM Sales.LineItem;

Question 4

(1/1 point)
The HumanResources.Employee table contains the following values:

EmployeeID	FirstName	MiddleName	LastName
1	Dan	NULL	Drayton
2	Victoria	(an empty string)	Gray
3	Rajab	NULL	Shammas
You write the following query:

SELECT EmployeeID, FirstName + ' ' + NULLIF(MiddleName, '') + ' ' + LastName AS EmployeeName
FROM HumanResources.Employee;

In the results returned by this query, what does the EmployeeName column contain?

NULL for employees 1, 2, and 3.


Question 5

(1/1 point)
The Sales.CustomerAddress table contains the following columns:

CustomerID (integer)
AddressID (integer)
StreetAddress (nvarchar(100))
City (nvarchar(30))
CountryRegion (nvarchar(30))
You write a query to return City and CountryRegion values in the table. Each unique combination of City and CountryRegion should appear only once in the results.

Which of the following queries returns the correct results?


SELECT DISTINCT City, CountryRegion FROM Sales.CustomerAddress; 


Question 6

(1/1 point)
The Production.Product table contains the following columns:

ProductID (integer)
ProductName (nvarchar(50))
ProductCategoryID (integer)
ListPrice (money)
You write the following SELECT query:

SELECT ProductName, ListPrice FROM Production.Product

You want the results of the query to return the products in ascending order of ProductCategoryID. The products in each category should be sorted by ListPrice, with the highest priced items in each category shown first.

Which of the following ORDER BY clauses should you add to the query?

ORDER BY ProductCategoryID ASC, ListPrice DESC 


Question 7

(1/1 point)
You write the following Transact-SQL query to retrieve data from the Sales.SalesOrderHeader table:

SELECT SalesOrderID, OrderDate, Amount
FROM Sales.SalesOrderHeader

You want to limit the results to include only sales in the first calendar quarter of 2015. Which two of the following WHERE clauses can you use to accomplish this goal? (assume US formats for dates, for example 3/31/2015 represents March 31st 2015)

 WHERE OrderDate BETWEEN '1/1/2015' AND '3/31/2015'
 WHERE OrderDate >= '1/1/2015' AND OrderDate <= '3/31/2015'


 Question 8

(1/1 point)
You write the following query to retrieve details of products that have been ordered:

SELECT p.ProductName, p.SupplierID, o.OrderDate, o.Quantity
FROM Sales.Order AS o
JOIN Inventory.Product AS p ON o.ProductID = p.ProductID;

You want to modify this query so that it includes products that have not been ordered, with NULL values for the OrderDate and Quantity columns.

To which of the following should you change the JOIN clause?

 RIGHT JOIN Inventory.Product AS p ON o.ProductID = p.ProductID;


Question 9

(1/1 point)
You write the following queries to retrieve all customers and customers who have placed orders.

SELECT CustomerID, FirstName, LastName
FROM Sales.Customer
_____________
SELECT o.CustomerID, c.FirstName, c.LastName
FROM Sales.Order AS o
JOIN Sales.Customer AS c ON o.CustomerID = c.CustomerID
ORDER BY LastName

Which statement should you use to combine the queries so that the results include only customers who have not placed any orders?


Question 10

(1/1 point)
The sales department occasionally run promotions that offer a discount on sales orders. Some promotions are associated with a specific product, while others are more general.

The Inventory.Product table contains the following columns:

ProductID (integer)
ProductName (nvarchar(50))
ListPrice (money)
The Sales.Promotion table contains the following columns:

PromotionID (integer)
StartDate (date)
EndDate (date)
ProductID (integer - can be NULL)
Discount (decimal)
You write the following query, which returns all product-based promotions and the products with which they are associated:

SELECT prm.StartDate, prm.EndDate, prm.Discount, prd.ProductName, prd.ListPrice
FROM Sales.Promotion as prm
JOIN Inventory.Product as prd ON prm.ProductID = prd.ProductID;

How should you modify the JOIN clause so that the query returns all promotions (with NULL ProductName and ListPrice values for promotions that are not associated with a product) and all products (with NULL StartDate, EndDate, and Discount values for products that have never been associated with a promotion)?

FULL OUTER JOIN Inventory.Product as prd ON prm.ProductID = prd.ProductID; 


Question 11

(1/1 point)
You write the following query to return the last date on which each product was sold. Products that have never been sold should return a NULL in the LastSold column.

SELECT p.ProductName, MAX(o.OrderDate) AS LastSold
FROM Sales.SalesOrder AS o
JOIN Sales.SalesOrderDetail AS od ON o.SalesOrderID = od.SalesOrderID
RIGHT JOIN Inventory.Product AS p ON od.ProductID = p.ProductID

Which of the following clauses should you add to complete the query?

GROUP BY p.ProductName; GROUP BY p.ProductName; - correct


Question 12

(1/1 point)
You write the following query:

SELECT ProductID, IIF(ISNUMERIC(ISNULL(Code, 0)) = 1,
                                    IIF(ISNULL(TRY_CAST(Code AS decimal), 0) >= 20, 'Special', 'Standard'),
                                     'Custom') AS ItemType
FROM Inventory.Product;

What value is returned in the ItemType column for a product with a Code value of 'X21'?

Custom Custom 


Question 13

(1/1 point)
You write the following query to return the lowest sales amount for each salesperson.

SELECT Salesperson, MIN(Amount) AS LowestSale
FROM Sales.vSalesOrders
GROUP BY Salesperson
_____________________________________________

Which clause should you add to the query so that the results include only salespeople whose lowest sales amount is greater than the average sale amount for all sales


 HAVING MIN(Amount)>(SELECT AVG(Amount) FROM Sales.vSalesOrders)
 
 Question 14

(1/1 point)
The Sales.Customer table includes the following columns:

CustomerID (integer)
FirstName (nvarchar(50))
LastName (nvarchar(50))
The Sales.SalesOrder table includes the following columns:

SalesOrderNumber (integer)
OrderDate (date)
CustomerID (integer)
Amount (money)
Some customers have placed mulitple orders over a period of years. You write the following query to retrieve the last date on which each customer placed an order:

SELECT c.CustomerID, c.FirstName, c.LastName,
            -- correlated subquery goes here
                AS LastOrderDate
FROM Sales.Customer AS c;

Which of the following subqueries should you use to complete the query?

  (SELECT MAX(o.OrderDate)
    FROM Sales.SalesOrder AS o
    WHERE o.CustomerID = c.CustomerID)
	

Question 15

(1 point possible)
You write the folowing code in SQL Server Management Studio

DECLARE @tab AS table(ProductID integer, StockCount integer)
INSERT INTO @tab
SELECT ProductID, InStock + OnOrder
FROM Inventory.Product;
GO
SELECT * FROM @tab;

When you execute the code, an error occurs. Which two of the following actions could you take to prevent the error?

 Modify the INSERT statement to:
INSERT INTO @tab
SELECT ProductID, InStock
FROM Inventory.Product;

 Remove the GO command 
 Use a temporary table named #tab instead of the @tab variable  
 Add a second GO command after the final SELECT statement 



 Question 16

(1/1 point)
You write the following query that includes a common table expression:

WITH CustomerNames (CustomerID, CustomerName)
AS
(
  SELECT CustomerID, CONCAT(FirstName, CONCAT(' ', LastName))
  FROM Sales.Customer
)
-- Retrieve customer names and total revenue

Which of the following SELECT statements can you use to complete the query so that it uses the CTE and returns the customer name and total sales amount for each customer that has placed an order?

SELECT c.CustomerName, SUM(o.Amount) AS CustomerRevenue
FROM CustomerNames AS c
JOIN Sales.SalesOrder AS o ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName;


Question 17

(1/1 point)
You create the following query:

SELECT c.City, c.CountryRegion, SUM(o.TotalDue) AS Revenue
FROM Sales.Customer AS c
JOIN Sales.SalesOrder AS o ON o.CustomerID = c.CustomerID
GROUP BY GROUPING SETS (CountryRegion, (CountryRegion, City), ())

Which three of the following values does this query return?

 A grand total of revenue for all sales.
 A revenue total for each CountryRegion.
 A revenue total for each CountryRegion and City combination.


 Question 18

(1/1 point)
A consultant has sent you some sales projections in the following format:

MonthOfYear	Asia	Europe	N.America
January	20125	36999	27675
February	22165	38779	29079
March	25149	40016	31472
You load this data into a temporary table named #forecast.

The sales manager has asked for the forecast data in the following format:

MonthOfYear	Region	Forecast
January	Asia	20125
January	Europe	36999
January	N.America	27675
February	Asia	22165
February	Europe	38779
February	N.America	29079
March	Asia	25149
March	Europe	40016
March	N.America	31472
Which of the following queries returns the correct results?


SELECT MonthOfYear, Region, Forecast
FROM
(SELECT MonthOfYear, Asia, Europe, N.America
 FROM #forecast) AS pvt
UNPIVOT(Forecast FOR Region IN (Asia, Europe, N.America)) AS unpvt
ORDER BY MonthOfYear, Region

Question 19

(1/1 point)
The Sales.Customer table contains the following columns:

Column Name	Data Type	NULL	Default
CustomerID	integer	False	Identity
FirstName	nvarchar(50)	False	
MiddleName	nvarchar(50)	True	
LastName	nvarchar(50)	False	
Active	bit	False	1
You want to insert a new record for the following customer:

First Name: Sophia
Middle Name: none
Last Name: Garner
Active: yes
Which two of the following INSERT statements successfully insert the record?

INSERT INTO Sales.Customer
VALUES
('Sophia', NULL, 'Garner', DEFAULT);

INSERT INTO Sales.Customer (FirstName, LastName)
VALUES
('Sophia', 'Garner');


Question 20

(1/1 point)
The Inventory.Product table contains the following columns:

ProductID (integer)
ProductName (nvarchar(100))
ListPrice (money)
Discontinued (bit)
LastUpdated (datetime)
You want to increase the list price of all non-discontinued products by 10%. The LastUpdated column for all records that are modified should be set to the current date and time.

Which of the following UPDATE statements performs the required modification correctly?


UPDATE Inventory.Product
SET ListPrice = ListPrice * 1.1,
        LastUpdated = GETDATE()
WHERE Discontinued = 0;



Question 21

(1/1 point)
You write the following Transact-SQL code, which deletes customers and their orders:

BEGIN TRY
  BEGIN TRANSACTION
    DELETE FROM Sales.SalesOrder WHERE CustomerID = @CustomerID;
    DELETE FROM Sales.Customer WHERE CustomerID = @CustomerID;
  COMMIT TRANSACTION
END TRY
BEGIN CATCH
  --code to handle exceptions
END CATCH

You want to implement the CATCH block so that:

Any transactions in process are rolled back.
The original exception is re-thrown to the calling application.
The XACT_ABORT option is not enabled.

Which code block implements the CATCH block correctly?


IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION
THROW;