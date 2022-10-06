Finding total rows
SELECT count(*) FROM 2014q1_capitalbikeshare

count
401122

Finding riders count based on membership type

SELECT member_type, count(*) as count 
FROM 2014q1_capitalbikeshare
group by member_type

member_type	     count
Member	     355755
Casual	     45367

Finding riders count based on station number

SELECT start_station_number, count(*) as count 
FROM 2014q1_capitalbikeshare
group by start_station_number
order by count DESC
