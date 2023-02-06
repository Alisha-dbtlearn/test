--added config block for incremental test , converted the view to table 
{{
    config(
        materialized='table'
    )
}}
with
    customer_orders as (

        select id as order_id, user_id as customer_id, order_date, status

        from {{source('jaffle_shop','orders')}}
    )
select * from customer_orders