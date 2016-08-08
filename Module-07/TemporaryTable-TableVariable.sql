--Temporary tables are prefixed with a # symbol and stored in a temporary workspace (the tempdb database in SQL Server).
--Temporary tables are automatically deleted when the session in which they were created ends.

--Creating Temporary table

CREATE TABLE #Colors
(Color Varchar(15));


--Inserting temporary table

INSERT INTO #Colors
SELECT DISTINCT Color FROM SalesLT.Product;

--Selecting table (You can select this table within the session. If the session is out again u need to create and insert)

SELECT * FROM #Colors;

--Table variables are prefixed with a @ symbol and are stored in memory.
--Table variables are scoped to the batch in which they are created.
--Both of them used for small data set.

---Table Variable(You need to run all the query at a time because its scope is within the run time)


DECLARE @Colors AS TABLE 
(Color Varchar(15));

--Inserting table variable

INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product;

--Selecting the table variable

SELECT * FROM @Colors;