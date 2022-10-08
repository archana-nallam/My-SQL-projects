LAG and LEAD
It can often be useful to compare rows to preceding or following rows, especially if you've got the data in an order that makes sense. You can use LAG or LEAD to create columns that pull values from other rows—all you need to do is enter which column to pull from and how many rows away you'd like to do the pull. LAG pulls from previous rows and LEAD pulls from following rows:


SELECT start_station,
       duration,
       LAG(duration, 1) OVER
         (PARTITION BY start_station ORDER BY duration) AS lag,
       LEAD(duration, 1) OVER
         (PARTITION BY start_station ORDER BY duration) AS lead
  FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-08'
 ORDER BY start_station, duration


SELECT start_station,
       duration,
       duration -LAG(duration, 1) OVER
         (PARTITION BY start_station ORDER BY duration)
         AS difference
  FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-08'
 ORDER BY start_station, duration


The first row of the difference column is null because there is no previous row from which to pull. Similarly, using LEAD will create nulls at the end of the dataset. If you'd like to make the results a bit cleaner, you can wrap it in an outer query to remove nulls:

SELECT * from
(SELECT start_station,
       duration,
       duration -LAG(duration, 1) OVER
         (PARTITION BY start_station ORDER BY duration)
         AS difference
  FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-08'
 ORDER BY start_station, duration) as sub
 where sub.difference is not null
