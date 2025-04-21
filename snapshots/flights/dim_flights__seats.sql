{% snapshot dim_flights__seats %}

{{
    config(
        target_schema='snapshot',
        unique_key='seat_id',
        strategy='check',
        check_cols=['aircraft_code', 'seat_no', 'fare_conditions'],
        dbt_valid_to_current = "'9999-01-01'::date"
    )
}}

select
seat_id,
aircraft_code,
seat_no,
fare_conditions
from    
    {{ ref('stg_flights__seats') }}

{% endsnapshot %}