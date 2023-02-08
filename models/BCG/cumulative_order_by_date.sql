{{
    config(
        materialized='table',
        alias='cumulative_sales_orders',
        database='PRACTICETEST',
        schema='BCGSAMPLE'
    )
}}
select distinct O_ORDERKEY,O_ORDERDATE,sum(O_TOTALPRICE) over (partition by O_ORDERDATE) as cumulative_sales
from snowflake_sample_data.tpch_sf1.orders order by O_ORDERDATE