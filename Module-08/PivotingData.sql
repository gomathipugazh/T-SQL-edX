CREATE TABLE #ProductColorPivot
(Name Varchar(50), Red int,Blue int, Black int, Silver int, Yellow int, Grey int, Multi int, UnColored int); 

INSERT INTO #ProductColorPivot
SELECT * FROM
(SELECT P.ProductID, PC.Name, ISNULL(P.Color, 'UnColored') AS Color
FROM SalesLT.ProductCategory AS PC
INNER JOIN SalesLT.Product AS P
ON PC.ProductCategoryID = P.ProductCategoryID
) AS PPC
PIVOT(COUNT(ProductID) FOR Color IN([Red], [Blue], [Black], [Silver], [Yellow], [Grey], [Multi], [UnColored])) AS #ProductColorPivot
ORDER BY Name;

SELECT * FROM #ProductColorPivot

--Unpivot

SELECT Name, Color, ProductCount
FROM
(SELECT Name,
[Red], [Blue], [Black], [Silver], [Yellow], [Grey], [Multi], [UnColored]
FROM  #ProductColorPivot)PCP
UNPIVOT
(ProductCount FOR Color IN ([Red], [Blue], [Black], [Silver], [Yellow], [Grey], [Multi], [UnColored])) AS ProductCounts