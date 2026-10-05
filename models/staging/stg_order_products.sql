select
    order_product_id,
    order_id,
    product_sku,
    amount,

from
    {{ src('raw_data', 'tblOrderProduct') }}
