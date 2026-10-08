{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'insert_overwrite',
        partition_by = {
            "field": "event_date",
            "data_type": "date"
        }
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
    lower(e.event_name) in ('product page view', 'add to cart', 'view basket', 'order receipt')

group by
    1, 2, 3, 4, 5

{% if is_incremental() %}

    -- Captures new data and late-arriving records within a specific window
    where event_date >= date_sub(current_date(), interval 3 day)

{% endif %}