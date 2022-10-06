A window function performs a calculation across a set of table rows that are somehow related to the current row. This is comparable to the type of calculation that can be done with an aggregate function. But unlike regular aggregate functions, use of a window function does not cause rows to become grouped into a single output row — the rows retain their separate identities. Behind the scenes, the window function is able to access more than just the current row of the query result.

The most practical example of this is a running total.

OVER clause is used with window functions to define that window. OVER clause does two things : 

Partitions rows into form set of rows. (PARTITION BY clause is used) 
Orders rows within those partitions into a particular order. (ORDER BY clause is used)

## Basic Syntax :  

SELECT coulmn_name1, 

 window_function(cloumn_name2)
 
 OVER([PARTITION BY column_name1] [ORDER BY column_name3]) AS new_column
 
FROM table_name;
