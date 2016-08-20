Review Question 1:

What value will the following query return in the OrderStatus column for rows with a Status value of 2?

SELECT OrderNumber, CHOOSE(Status, 'Ordered', 'Shipped', 'Delivered') AS OrderStatus
FROM Sales.SalesOrderHeader

Shipped


Review Question 2:


The Sales.SalesOrderDetail table contains a row for each line item that has been ordered. Each row includes the following columns:
ProductID: The unique ID of the product that was ordered.
Quantity: How many units of the product were ordered.
UnitPrice: The price per unit charged for the product.
You run the following query:

SELECT COUNT(ProductID) AS ProductIDCount, COUNT(Quantity) AS QuantityCount, SUM(UnitPrice) AS PriceSum
FROM Sales.SalesOrderDetail;

What does the value returned by the query for the QuantityCount column represent?
The number of rows containing a Quantity value 


Review Question 3:


You write a query that counts customers. Each customer lives in a city, and each city is located within a state. The results should show the count of customers in each city in every state.
Select the code required to complete the query:

SELECT COUNT(CustomerID) AS CustomerCount, City AS CustomerCity, State AS CustomerState
FROM Sales.Customer
______________________ ;
GROUP BY State, City