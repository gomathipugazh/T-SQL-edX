--Display the sales order details  for items that are  equal to  the maximum unit price for that sales order 

SELECT OH.SalesORderID, MUP.MaxUnitPrice
FROM SalesLT.SalesOrderHeader AS OH
CROSS APPLY SalesLT.udfMaxUnitPrice(OH.SalesOrderID) AS MUP
ORDER BY OH.SalesOrderID;

sp_helptext 'saleslt.udfmaxunitprice'