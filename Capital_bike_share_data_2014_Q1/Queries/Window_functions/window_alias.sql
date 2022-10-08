Defining a window alias
If you're planning to write several window functions in to the same query, using the same window, you can create an alias. Take the NTILE example above:

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


With Window alias:
SELECT start_station,
       duration,
       NTILE(4) OVER ntile_window AS quartile,
       NTILE(5) OVER ntile_window AS quintile,
       NTILE(100) OVER ntile_window AS percentile
FROM 2014q1_capitalbikeshare
WHERE start_date < '2014-01-08'
WINDOW ntile_window AS
         (PARTITION BY start_station ORDER BY duration)
ORDER BY start_station, duration

The WINDOW clause, if included, should always come after the WHERE clause
