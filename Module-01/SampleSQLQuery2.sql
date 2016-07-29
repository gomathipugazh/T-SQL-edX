select Orderdate, count(salesorderid) AS orderid from Saleslt.SalesOrderHeader where status = 5 group by orderdate having count(salesorderid)>1 order by orderdate desc;
select * from Saleslt.SalesOrderHeader;

SELECT ProductID, Name, Color, Size, Color + Size AS Style
FROM SalesLT.Product;




