{{
    config(
        materialized = 'table',
    )
}}
select
a.ticket_no,
a.flight_id,
a.fare_conditions,
a.amount,
case when b.seat_no is null then False else True end boarding_pass_exists,
b.boarding_no,
b.seat_no,
LOCALTIMESTAMP as load_date
from
    {{ ref('stg_flights__ticket_flights') }} as a
left join {{ ref('stg_flights__boarding_passes') }} as b 
using (ticket_no)