--Common Table Expressions (CTEs) provide a more intuitive syntax or defining rowsets than derived tables, and can be used mulitple times in the same query.
--You can use CTEs to define recursive queries

WITH ProductByCategory(ProductID, ProductName, Category)
AS
(
SELECT P.ProductID, P.Name, C.Name AS Category
FROM SalesLT.Product AS P
INNER JOIN SalesLT.ProductCategory AS C
ON P.ProductCategoryID = C.ProductCategoryID
) 

SELECT Category, COUNT(ProductID) AS Products
FROM ProductsByCategory
GROUP BY Category
ORDER BY Category;
GO

SELECT * FROM SalesLT.Employee;

WITH OrgReport(ManagerID, EmployeeID, EmployeeName, Level)
AS
(
SELECT E.ManagerID, E.EmployeeID, E.EmployeeName, 0
FROM SalesLT.Employee AS e
WHERE ManagerID IS NULL

UNION ALL
--Recursive query

SELECT E.ManagerID, E.EmployeeID, E.EmployeeName, Level + 1
FROM SalesLT.Employee AS E
INNER JOIN OrgReport AS O 
ON E.ManagerID = O.EmployeeID 
)

SELECT * FROM OrgReport
OPTION (MAXRECURSIVE 3);