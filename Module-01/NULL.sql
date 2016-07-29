--NULL NumericSize = 0 

SELECT Name, ISNULL(TRY_CAST(Size as Integer),0) AS NumericSize
FROM SalesLT.Product;

--NULL String = blank string

SELECT ProductNumber, ISNULL(Color,' ' ) + ', ' + ISNULL(Size,' ' ) AS ProductDetails
FROM SalesLT.Product;

--Multi Color = Null

SELECT Name, NULLIF(Color, 'Multi') AS SingleColor
From SalesLT.Product;

--Find first non-null date
SELECT Name, DiscontinuedDate, SellEndDate, SellStartDate, COALESCE(DiscontinuedDate, SellEndDate, SellStartDate) AS LastActivity
FROM SalesLT.Product;

--Using CASE for a column

SELECT Name,
		CASE 
			WHEN SellEndDate IS NULL THEN 'On Sale'
			ELSE 'Discontinued'
		END As SalesStatus
FROM SalesLT.Product;

SELECT NAME,
		CASE SIZE
			WHEN 'S' THEN 'Small'
			WHEN 'M' THEN 'Medium'
			WHEN 'L' THEN 'Large'
			WHEN 'XL' Then 'Extra Large'
			ELSE ISNULL(Size, 'n/a')
		END AS ProductSize
FROM  SalesLT.Product;


