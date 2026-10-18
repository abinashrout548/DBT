
with CTE as (
select
TO_Timestamp(STARTED_AT) AS Date_Time,
DATE(TO_Timestamp(STARTED_AT)) Date_Count,
Hour(TO_Timestamp(STARTED_AT)) AS Hour_Count,

Case 
when
Dayname(TO_Timestamp(STARTED_AT)) in ('Sat','Sun') THEN 'Weekend'
Else 'BusinessDay'
end as DAY_TYPE,

Case When 
Month(TO_Timestamp(STARTED_AT)) in (11,12,1,2) THEN 'Winter'
When 
Month(TO_Timestamp(STARTED_AT)) in (3,4,5,6) THEN 'Summer'
When 
Month(TO_Timestamp(STARTED_AT)) in (7,8,9,10) THEN 'Rain'
Else 'Please Check The Month'
End as Month_of_Year

from 
{{ source('demo', 'bike') }}
where STARTED_AT !='Started_at'

)
select * from CTE

