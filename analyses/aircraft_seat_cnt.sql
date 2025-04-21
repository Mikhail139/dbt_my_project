SELECT
model, COUNT (*) as cnt
FROM
{{ ref('stg_flights__seats') }} a
INNER JOIN {{ ref('stg_flights__aircrafts') }} b USING (aircraft_code)
GROUP BY model