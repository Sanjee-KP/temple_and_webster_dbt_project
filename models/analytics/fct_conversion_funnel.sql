{{
    config(
        materialized='incremental'
    )
}}

select
    date(e.event_datetime) as event_date,
    e.device,
    e.country,
    e.customer_type,
    e.event_name,
    coalesce(count(distinct e.session_id), 0) as session_count,
    coalesce(count(distinct e.customer_id), 0) as customer_count,

from
    {{ ref('stg_events') }} e

where
    lower(e.event_name) = 'product page view'
    and lower(e.event_name) = 'add to cart'
    and lower(e.event_name) = 'view basket'
    and lower(e.event_name) = 'order receipt'

group by
    1, 2, 3, 4, 5

{% if is_incremental() %}

where date(e.event_datetime) >= (select max(date(e.event_datetime)) from {{ this }} )

{% endif %}