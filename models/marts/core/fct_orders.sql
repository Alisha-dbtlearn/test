{{   config(
        materialized='view'
    )
}}
with
    fct_orders as (
        select order_id, payment_id, amount
        from {{ ref("stg_orders") }} o
        left join {{ ref("stg_payment") }} p on o.order_id = p.orderid
    )
select *
from fct_orders
