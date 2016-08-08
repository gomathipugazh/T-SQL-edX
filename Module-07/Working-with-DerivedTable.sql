--A derived table is a subquery that generates a multicolumn rowset. You must use the AS clause to define an alias for a derived query

SELECT Category, COUNT(ProductID) AS Products
FROM 
	(SELECT P.ProductID, P.Name AS Product, C.Name AS Category
	 FROM SalesLT.Product AS P
	 INNER JOIN SalesLT.ProductCategory AS C
	 ON P.ProductCategoryID = C.ProductCategoryID) AS PC
	GROUP BY Category
	ORDER BY Category;