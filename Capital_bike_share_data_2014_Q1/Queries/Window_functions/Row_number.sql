ROW_NUMBER()

ROW_NUMBER() does just what it sounds like—displays the number of a given row. 
It starts are 1 and numbers the rows according to the ORDER BY part of the window statement. 
ROW_NUMBER() does not require you to specify a variable within the parentheses:

SELECT start_station,
       start_date,
       duration,
       ROW_NUMBER() OVER (ORDER BY start_date desc)
                    AS row_number
 FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-08'
