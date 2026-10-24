CREATE OR REPLACE TABLE DEMO.DEMO_SCHEMA.WEATHER(
CITYNAME STRING,
LAT FLOAT,
LON FLOAT,
CLOUDS INTEGER,
HUMIDITY INTEGER,
PRESSURE FLOAT,
TEMP FLOAT,
TIME TIMESTAMP,
WEATHER STRING
);


SELECT 
t.$1,
t.$1:city.findname,
t.$1:city.coord.lat,
t.$1:city.coord.lon,
--t.$1:country.findname
t.$1:clouds.all,
t.$1:main.humidity,
t.$1:main.pressure,
t.$1:main.temp,
t.$1:MAIN.TIME,
t.$1:WEATHER[0]:MAIN
FROM @DEMO.demo_schema.WEATHER_STAGE T;

COPY INTO DEMO.DEMO_SCHEMA.WEATHER
FROM 
(
SELECT 
--t.$1,
t.$1:city.findname,
t.$1:city.coord.lat,
t.$1:city.coord.lon,
--t.$1:country.findname
t.$1:clouds.all,
t.$1:main.humidity,
t.$1:main.pressure,
t.$1:main.temp,
t.$1:MAIN.TIME,
t.$1:WEATHER[0]:MAIN
FROM @DEMO.demo_schema.WEATHER_STAGE T);

SELECT  * FROM DEMO.demo_schema.WEATHER LIMIT 2;
SELECT  * FROM DEMO.demo_schema.WEATHERTABLE LIMIT 2;

select * from weather limit 10