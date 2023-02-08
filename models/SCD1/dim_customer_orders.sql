{{
    config(
        materialized='table',
        alias='CUST_ORDER_TOTAL_PRICE_STG',
    )
}}
select O_ORDERKEY , sum(O_TOTALPRICE) as total_price
 from {{ source('snowflake_sample_data', 'orders') }}
 group by 1