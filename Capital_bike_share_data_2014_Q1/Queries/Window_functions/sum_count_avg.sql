Window functions: SUM, COUNT, and AVG

SELECT start_station,
       duration,
       SUM(duration) OVER (PARTITION BY start_station) AS running_sum,
       count(duration) OVER (PARTITION BY start_station) AS running_count,
       AVG(duration) OVER (PARTITION BY start_station) AS running_avg
  FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-31'

Including the order by

SELECT start_station,
       duration,
       SUM(duration) OVER (PARTITION BY start_station ORDER BY start_date) AS running_sum,
       count(duration) OVER (PARTITION BY start_station ORDER BY start_date) AS running_count,
       AVG(duration) OVER (PARTITION BY start_station ORDER BY start_date) AS running_avg
  FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-31'

By End station

SELECT end_station,
       duration,
       SUM(duration) OVER (PARTITION BY start_station ORDER BY start_date) AS running_total
  FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-31'
