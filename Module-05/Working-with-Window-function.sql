--Window function

SELECT TOP(100) ProductID, Name, ListPrice,
		RANK() OVER (ORDER BY ListPrice DESC) AS RankByPrice
FROM  SalesLT.Product AS P
ORDER BY RankByPrice;

SELECT PC.Name AS Category, P.Name AS Product, ListPrice,
	   RANK() OVER(PARTITION BY PC.Name ORDER BY ListPrice DESC) AS RankByPrice
FROM SalesLT.Product AS P
INNER JOIN SalesLT.ProductCategory AS PC
ON P.ProductCategoryID = PC.ProductCategoryID
ORDER BY Category, RankByPrice;

