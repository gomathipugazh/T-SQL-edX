Review Question 1

(1 point possible)
You use an INSERT statement to insert specific values into a table.

For which of the following columns do you not need to provide values?

 IDENTITY columns  
 Nullable columns that have no default value  
 Non-Nullable columns that have a default value  
 Nullable columns that have a default value


 Review Question 2

(1/1 point)
You need to determine the most recently inserted IDENTITY column in a specific table.

Which statement should you use?

 SELECT IDENT_CURRENT('table_name') 


 Review Question 3

(1/1 point)
You want to use a single statement to load new product catalog data from a staging table into the Production.Products table. Products are uniquely identified by a ProductID value. You want to apply the following logic:

If the ProductID exists in the staging table but not the Production.Products table, insert a new row into the Production.Products table.
If the ProductID exists in the Production.Products table but not the staging table, update the row for that product in the Production.Products table to set its Discontinued column to 1.
If the ProductID exists in both tables, update the row in the Production.Products table and set all column values to match the values in the staging table.
What type of statement should you use?

 A MERGE statement 