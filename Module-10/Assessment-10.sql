Review Question 1

(1/1 point)
The organization you work for has a fiscal year that runs from July to June. 
For example, FY 2015 covers the period from July 1st 2014 to June 30th 2015. 
The Sales.SalesOrder table contains records of sales transactions, 
and the table includes an FY column to indicate in which fiscal year each transaction occurred.

You need to write a script that returns all transaction data for the current fiscal year. 
Which two of the following scripts accomplishes this?

 -- Option 2
DECLARE @fy int;
IF MONTH(GETDATE()) <= 6
 SET @fy = YEAR(GETDATE());
ELSE
 SET @fy = YEAR(GETDATE())+1;
SELECT * FROM Sales.SalesOrder WHERE FY = @fy


 -- Option 4
DECLARE @fy int = YEAR(GETDATE());
IF MONTH(GETDATE()) > 6
 SET @fy = @fy + 1;
SELECT * FROM Sales.SalesOrder WHERE FY = @fy


Review Question 2

(1/1 point)
How many times will the loop in the following code be executed?

DECLARE @i int = 1;
WHILE @i < 10
BEGIN
 PRINT @i;
END


 Infinitely Infinitely 


 Review Question 3

(1/1 point)
You are using the following Transact-SQL code to generate test data. The code loops once for each day between a year ago from the current date and today, and for each day it inserts rows into the #Orders temporary table for every combination of product and customer. You want to stop inserting data when the #Orders table contains over 1 million rows.

DECLARE @d DATETIME = DATEADD(dd, -365, GETDATE());
WHILE @d < GETDATE()
BEGIN
 INSERT INTO #Orders
 SELECT @d, c.CustomerID, p.ProductID
 FROM Sales.Customer AS c
 CROSS JOIN Production.Product AS p;
 DECLARE @c int;
 SELECT @c = COUNT(*) FROM #Orders;
 IF @c > 1000000
  _____________;
 SET @d = DATEADD(dd, 1, @d);
END

Select the statement that is missing in the code.

 
BREAK 