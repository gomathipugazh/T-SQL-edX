--Display a list of product colors with the word 'none' if the value is null sorted by color

SELECT DISTINCT ISNULL(Color,'None') AS Color  
FROM SalesLT.Product ORDER BY Color;

--Display a list of product colors with the word 'none' and if the value is null and a dash if the value is null sorted by color

SELECT DISTINCT ISNULL(Color,'None') AS Color, ISNULL(Size, '-') AS Size
FROM SalesLT.Product ORDER BY Color;

--Display top 100 product by list price
SELECT TOP 100 Name, ListPrice 
FROM SalesLT.Product ORDER BY ListPrice DESC;

--Display first ten product by product number
SELECT Name, ListPrice 
FROM SalesLT.Product ORDER BY ProductNumber OFFSET 0 ROWS FETCH NEXT 10 ROWS Only;

--Display next ten product by product number
SELECT Name, ListPrice 
FROM SalesLT.Product ORDER BY ProductNumber OFFSET 10 ROWS FETCH NEXT 10 ROWS Only;