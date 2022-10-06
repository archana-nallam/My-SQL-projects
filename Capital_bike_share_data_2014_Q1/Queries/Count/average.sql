Find average duration travelled based on member type:

SELECT member_type, AVG(duration) as average_duration 
FROM 2014q1_capitalbikeshare
group by member_type

member_type	         average_duration
Member	         629.7344
Casual	         2216.3460
