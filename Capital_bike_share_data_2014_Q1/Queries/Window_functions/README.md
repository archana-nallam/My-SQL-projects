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


### Aggregate Window Function : 

Various aggregate functions such as SUM(), COUNT(), AVERAGE(), MAX(), MIN() applied over a particular window (set of rows) are called aggregate window functions. 

### Ranking Window Functions : 
Ranking functions are, RANK(), DENSE_RANK(), ROW_NUMBER() 

### RANK() – 
As the name suggests, the rank function assigns rank to all the rows within every partition. 
Rank is assigned such that rank 1 given to the first row and rows having same value are assigned same rank. 
For the next rank after two same rank values, one rank value will be skipped. 
 

### DENSE_RANK() – 
It assigns rank to each row within partition. Just like rank function first row is assigned rank 1 and rows having same value have same rank. 
The difference between RANK() and DENSE_RANK() is that in DENSE_RANK(), for the next rank after two same rank, consecutive integer 
is used, no rank is skipped. 
 

### ROW_NUMBER() – 
It assigns consecutive integers to all the rows within partition. Within a partition, no two rows can have same row number. 
