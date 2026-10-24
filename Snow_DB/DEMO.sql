--Create DATABASE DEMO;
--Create Schema DEMO_SCHEMA;

use DEMO;

--create warehouse if not exists my_largewh
--with warehouse_size = 'X-Large';

create or replace stage DEMO.DEMO_SCHEMA.WEATHER_STAGE
URL='s3://snowflake-workshop-lab/weather-nyc'
FILE_FORMAT= (TYPE='JSON')

LIST @DEMO.DEMO_SCHEMA.weather_STAGE

create or replace table DEMO.DEMO_SCHEMA.WEATHERTABLE (DATA VARIANT); --CHECK DETAILS OF VARIANT

COPY INTO DEMO.DEMO_SCHEMA.WEATHERTABLE 
FROM @DEMO.DEMO_SCHEMA.weather_STAGE

SELECT * FROM @DEMO.DEMO_SCHEMA.WEATHER_STAGE
SELECT * FROM DEMO.DEMO_SCHEMA.WEATHERTABLE

COPY INTO DEMO.DEMO_SCHEMA.WEATHERTABLE 
(SELECT HERE 
FROM @DEMO.DEMO_SCHEMA.weather_STAGE)

SELECT 
data:city.findname,
data:city.coord.lat,
data:city.coord.lon,
--data:country.findname
data:clouds.all,
data:main.humidity,
data:main.pressure,
data:main.temp,
DATA:MAIN.TIME,
DATA:WEATHER[0]:MAIN
FROM DEMO.DEMO_SCHEMA.WEATHERTABLE

