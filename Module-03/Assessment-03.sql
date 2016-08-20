Review Question 1

(1/1 point)
You write a query that returns a list of all sales employees that have taken sales orders. Employees who have not taken sales orders should not be included in the results.

Select the appropriate join type to complete the following query.

SELECT e.FirstName, e.LastName, s.Amount
FROM HumanResources.Employee AS e
________________ Sales.SalesOrder AS s ON s.SalesPersonID = e.EmployeeID;

 INNER JOIN


 Review Question 2

(1/1 point)
The Products table contains a row for each product that your company sells, and the SalesItems table contains a row for each line item that has been sold, including the ProductID value of the sold product from the Products table.

You want to write a query that returns rows from the Products table and the SalesItems table. The results should include all products, with sales data from the SalesItems table for products that have been sold, and NULL values for products that have not been sold.

Which type of join should you use?

 An outer join 


 Review Question 3

(1/1 point)
You write a query to generate test data from a table of customers and a table of products. You want to generate a set of sales orders in which every customer has ordered every product.

What kind of join should you use?


A cross join 