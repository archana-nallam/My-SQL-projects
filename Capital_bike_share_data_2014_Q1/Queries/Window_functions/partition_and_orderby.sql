SELECT duration,
       SUM(duration) OVER (ORDER BY start_date) AS running_total
FROM 2014q1_capitalbikeshare


If you'd like to narrow the window from the entire dataset to individual groups within the dataset, you can use PARTITION BY to do so

SELECT start_station,
       duration,
       SUM(duration) OVER
         (PARTITION BY start_station ORDER BY start_date)
         AS running_total
  FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-31'


Partition without order by, will end up showing the final running total for all entries of the same station

SELECT start_station,
       duration,
       SUM(duration) OVER
         (PARTITION BY start_station)
         AS running_total
  FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-31'
