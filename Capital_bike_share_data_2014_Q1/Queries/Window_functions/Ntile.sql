NTILE
You can use window functions to identify what percentile (or quartile, or any other subdivision) a given row falls into. 
The syntax is NTILE(*# of buckets*). In this case, ORDER BY determines which column to use to determine the quartiles 
(or whatever number of 'tiles you specify)


SELECT start_station,
       duration,
       NTILE(4) OVER
         (PARTITION BY start_station ORDER BY duration)
          AS quartile,
       NTILE(5) OVER
         (PARTITION BY start_station ORDER BY duration)
         AS quintile,
       NTILE(100) OVER
         (PARTITION BY start_station ORDER BY duration)
         AS percentile
  FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-08'
 ORDER BY start_station, duration
