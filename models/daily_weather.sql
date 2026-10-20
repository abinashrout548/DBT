with daily_weather as (

    select 
    date(time) as daily_weather,
    weather,temp,
    pressure,
    humidity,
    clouds
    
     from {{ source('demo', 'weather') }}
     where weather is not null
    limit 10
),

daily_weather_agg as (

    select daily_weather,
    weather,
    count(weather),

Row_number() over (partition by daily_weather order by count(weather) desc ) as rownumber

    from daily_weather 

    group by daily_weather, weather
  
qualify Row_number() over (partition by daily_weather order by count(weather) desc ) = 1
)
select * from daily_weather_agg 