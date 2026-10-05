select
    Event_id as event_id,
    datetime(event_date, 'Australia/Sydney') as event_datetime,
    session_id,
    customer_id,
    string(data_payload.event_name) as event_name,
    string(data_payload.device) as device,
    string(data_payload.product_id) as product_id,
    string(data_payload.product_category) as product_category,
    string(data_payload.country) as country,
    string(data_payload.customer_type) as customer_type,

from
    {{ src('raw_data', 'tblEvent') }}