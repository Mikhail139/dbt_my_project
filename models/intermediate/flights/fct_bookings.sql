{{
    config(
        materialized = 'table',
        meta = {
            'owner':'misha14292gmail.com'
        }
    )
}}
select
book_ref,
book_date,
total_amount
from
    {{ ref('stg_flights__bookings') }}