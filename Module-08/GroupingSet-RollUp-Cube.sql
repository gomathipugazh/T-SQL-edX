--Simple Group by

SELECT CAT.ParentProductCategoryName, CAT.ProductCategoryName, COUNT(P.ProductID) AS Products
FROM SalesLT.vGetAllCategories AS CAT
LEFT JOIN SalesLT.Product AS P
ON P.ProductCategoryID = CAT.ProductCategoryID
GROUP BY CAT.ParentProductCategoryName, CAT.ProductCategoryName
ORDER BY CAT.ParentProductCategoryName, CAT.ProductCategoryName;

--Grouping Set gives Grand total, Product category total and parent product category total

SELECT CAT.ParentProductCategoryName, CAT.ProductCategoryName, COUNT(P.ProductID) AS Products
FROM SalesLT.vGetAllCategories AS CAT
LEFT JOIN SalesLT.Product AS P
ON P.ProductCategoryID = CAT.ProductCategoryID
--GROUP BY GROUPING SETS(CAT.ParentProductCategoryName, CAT.ProductCategoryName, ())
--GROUP BY GROUPING SETS(CAT.ParentProductCategoryName, (CAT.ParentProductCategoryName, CAT.ProductCategoryName), ())
ORDER BY CAT.ParentProductCategoryName, CAT.ProductCategoryName;

--RollUp gives additional information than grouping set. Grand total, Parent Product category total, 
--combination of Product category and parent product category total 


SELECT CAT.ParentProductCategoryName, CAT.ProductCategoryName, COUNT(P.ProductID) AS Products
FROM SalesLT.vGetAllCategories AS CAT
LEFT JOIN SalesLT.Product AS P
ON P.ProductCategoryID = CAT.ProductCategoryID
GROUP BY ROLLUP(CAT.ParentProductCategoryName, CAT.ProductCategoryName)
ORDER BY CAT.ParentProductCategoryName, CAT.ProductCategoryName;

--Cube gives much more information than rollup. Grand total, Product category total, parent product category total and
-- combination of parent product category and product category total. 

SELECT CAT.ParentProductCategoryName, CAT.ProductCategoryName, COUNT(P.ProductID) AS Products
FROM SalesLT.vGetAllCategories AS CAT
LEFT JOIN SalesLT.Product AS P
ON P.ProductCategoryID = CAT.ProductCategoryID
GROUP BY CUBE(CAT.ParentProductCategoryName, CAT.ProductCategoryName)
ORDER BY CAT.ParentProductCategoryName, CAT.ProductCategoryName;