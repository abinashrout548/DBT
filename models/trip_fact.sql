--*** DBT - Trip fact ***

--Documentation on the TIMESTAMPDIFF function in snowflake: https://docs.snowflake.com/en/sql-reference/functions/timestampdiff


--Code used for trip_fact.sql model:

WITH TRIPS as (

select
RIDE_ID,
RIDEABLE_TYPE,
DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
START_STATION_ID AS START_STATION_ID,
END_STATION_ID,
MAEBER_CASUAL AS MAEBER_CASUAL,
TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS

from {{ source('demo', 'bike') }}

where RIDE_ID != 'ride_id'

)

select
*
from TRIPS

