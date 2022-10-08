RANK() and DENSE_RANK()

RANK() is slightly different from ROW_NUMBER(). If you order by start_time, for example, it might be the case that some terminals have rides with two identical start times. In this case, they are given the same rank, whereas ROW_NUMBER() gives them different numbers.

SELECT start_station,
       duration,
       RANK() OVER (PARTITION BY start_station
                    ORDER BY start_date)
              AS rank
  FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-08'


SELECT start_station,
       duration,
       DENSE_RANK() OVER (PARTITION BY start_station
                    ORDER BY start_date)
              AS rank
  FROM 2014q1_capitalbikeshare
 WHERE start_date < '2014-01-08'