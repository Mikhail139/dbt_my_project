{{
    config(
        materialized = 'table'
    )
}}
select
seat_id,
aircraft_code,
seat_no,
fare_conditions
from 
  {{ source('demo_src', 'seats') }}
    