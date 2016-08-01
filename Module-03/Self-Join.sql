-- Create employee table

CREATE TABLE SalesLT.Employee
(EmployeeID int IDENTITY Primary Key,
 EmployeeName nvarchar(256),
 ManagerID int);
 GO
 
 --Inserting employee table

 INSERT INTO SalesLT.Employee(EmployeeName, ManagerID)
 SELECT DISTINCT Salesperson, NULLIF(CAST(RIGHT(SalesPerson, 1)AS INT), 0)
 FROM SalesLT.Customer;
 GO

 UPDATE SalesLT.Employee
 SET ManagerID = (SELECT MIN(EmployeeID) FROM SalesLT.Employee WHERE ManagerID IS NULL)
 WHERE ManagerID IS NULL
 AND EmployeeID > (SELECT MIN(EmployeeID) FROM SalesLT.Employee WHERE ManagerID IS NULL);
 GO

 SELECT * FROM SalesLT.Employee;


--Self-Join

SELECT E.EmployeeName, M.EmployeeName AS ManagerName
FROM SalesLT.Employee AS E
LEFT JOIN SalesLT.Employee AS M
ON E.ManagerID = M.EmployeeID
ORDER BY E.ManagerID;