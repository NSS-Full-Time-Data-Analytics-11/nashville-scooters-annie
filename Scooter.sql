SELECT pubtimestamp, companyname, triprecordnum, sumdid, tripduration, tripdistance, startdate, starttime, enddate, endtime, startlatitude, startlongitude, endlatitude, endlongitude, triproute, create_dt
	FROM public.trips;
	

-- Places that are most traveled to (Group by ending and starting lon/lat)  using SQL 

SELECT endlongitude, endlatitude,companyname,COUNT(*) AS num_visits
FROM trips
GROUP BY 1,2,3
ORDER BY num_visits DESC



SELECT startdate, COUNT(startdate) as datecount, DATE_PART('dow', startdate) AS days_of_week
FROM trips
GROUP BY 1,3
ORDER BY 2,3 DESC


SELECT startdate, COUNT(startdate) as datecount, 
CASE WHEN DATE_PART ('dow', startdate) = 1 THEN 'Monday'  -- (DATE_PART(dow) extract the Day of Week)
	 WHEN DATE_PART ('dow', startdate) = 2 THEN 'Tuesday'
	 WHEN DATE_PART ('dow', startdate) = 3 THEN 'Wednesday'
	 WHEN DATE_PART ('dow', startdate) = 4 THEN 'Thursday'
	 WHEN DATE_PART ('dow', startdate) = 5 THEN 'Friday'
	 WHEN DATE_PART ('dow', startdate) = 6 THEN 'Saturday'
	 WHEN DATE_PART ('dow', startdate) = 7 THEN 'Sunday' END  as days_of_week
FROM trips
GROUP BY 1,3
ORDER BY 2,3 DESC


--COmpany wise Avg cost per min  most afforable , most 
WITH grp_scooter as (SELECT companyname, avg(costpermin) as avg_cost_per_min
					 from scooters 
					 GROUP by 1
					 order by 2 ASC )

SELECT companyname, costpermin from scooters
GROUP by 1,2

SELECT companyname, costpermin, round(avg(costpermin),2) as avg_cost_per_min from scooters
GROUP by 1,2
ORDER by 3 ASC



