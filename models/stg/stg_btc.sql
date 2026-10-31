{{config(materialized='incremental', incremental_strategy='merge', unique_key='HASH_KEY')}}

select * from {{ source('BTC', 'BTC') }}