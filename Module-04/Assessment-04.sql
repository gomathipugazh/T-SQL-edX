Review Question 1

(1/1 point)
You write a query that returns the set of products that are available in the color 'Red' or the size 'XL' by combining the results of two queries. Any products that are available in both red and size XL should be included as a duplicate row in the resultset.

Select the appropriate missing keyword.

SELECT ProductID, Name, Color, Size
FROM Production.Product
WHERE Color = 'Red'
__________
SELECT ProductID, Name, Color, Size
FROM Production.Product
WHERE Size = 'XL'
ORDER BY ProductID;

UNION ALL


Review Question 2

(1/1 point)
You write the following Transact-SQL query that returns the CustomerName, StreetAddress, City, and PostalCode columns from the Sales.BillingAddress table:

SELECT CustomerName, StreetAddress, City, PostalCode
FROM Sales.BillingAddress;

You have also written the following query to retrieve the same fields from the Sales.ShippingAddress table:

SELECT CustomerName, StreetAddress, City, PostalCode
FROM Sales.ShippingAddress;

What set operator can you use to combine the results of these queries and return only rows for customers whose billing address is the same as their shipping address?



INTERSECT INTERSECT 


Review Question 3

(1/1 point)
The Sales.SalesOrderDetail table contains a row for every line item sold, and includes a ProductID column to identify the product that was ordered.

The Production.Product table contains a row for every product, and includes a Discontinued column where the value 1 indicates that the product has been discontinued.

What result does the following query return?

SELECT DISTINCT ProductID
FROM Sales.SalesOrderDetail
EXCEPT
SELECT ProductID
FROM Production.Product
WHERE Discontinued = 1;

 All non-discontinued products that have been sold. 
