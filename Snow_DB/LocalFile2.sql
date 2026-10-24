
select 
t.$1,
t.$2,
t.$3,
t.$4,
t.$5,
t.$6,
t.$7,
t.$8,
t.$9,
t.$10,
t.$11,
t.$12,
t.$13
from @demo.demo_schema.Bike_stage t;

create or replace table demo.demo_schema.BIKE(
RIDE_ID STRING,
RIDEABLE_TYPE STRING,
STARTED_AT STRING,
ENDED_AT STRING,
START_STATION_NAME STRING,
START_STATION_ID STRING,
END_STATION_NAME STRING,
END_STATION_ID STRING,
START_LAT STRING,
START_LNG STRING,
END_LAT STRING,
END_LNG STRING,
MAEBER_CASUAL STRING
);



copy into demo.demo_schema.BIKE
FROM(
select 
t.$1,
t.$2,
t.$3,
t.$4,
t.$5,
t.$6,
t.$7,
t.$8,
t.$9,
t.$10,
t.$11,
t.$12,
t.$13
from @demo.demo_schema.Bike_stage t)
ON_ERROR=SKIP_FILE_1;
     