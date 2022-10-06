Write a query that shows the duration of each ride as a percentage of the total time accrued by riders from each start_terminal

SELECT start_station,
       duration,
       SUM(duration) OVER (PARTITION BY start_station) AS start_terminal_sum,
       (duration/sum(duration) OVER (PARTITION BY start_station))*100 as percent_of_total_time
  FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-31'
 ORDER BY 1, 4 DESC
