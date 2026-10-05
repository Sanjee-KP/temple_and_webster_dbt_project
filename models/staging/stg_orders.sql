select
    order_id,
    datetime(order_date, 'Australia/Sydney') as order_datetime, -- assuming order_date is in UTC, convert to AEST
    customer_id,
    payment_type,
    gift_card_order_product_id,
    source,

from
    {{ src('raw_data', 'tblOrder') }}
