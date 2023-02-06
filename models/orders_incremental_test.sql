{{ config(materialized="incremental", unique_key="order_id") }}
with
    orders as (

        select *
        from {{ ref("stg_orders") }}
        {% if is_incremental() %}
        -- this filter will only be applied on an incremental run
        -- took 3 days data before max date
        where order_date > (select dateadd('day', -3, max(order_date)) from {{ this }})
        -- if we give >= 
        -- it would have taken duplicate records , for that we have to add unique key
        -- value in configuration in
        -- order to avoid the duplication of data in destination table based on the
        -- key/unique key column
        {% endif %}
    )
select *
from
    orders

-- backend query
   /* merge into analytics.dbt_akanungo.orders_incremental_test as dbt_internal_dest
using
    analytics.dbt_akanungo.orders_incremental_test__dbt_tmp as dbt_internal_source
    on dbt_internal_source.order_id = dbt_internal_dest.order_id
when matched
then
    update set
    "ORDER_ID" = dbt_internal_source."ORDER_ID",
    "CUSTOMER_ID" = dbt_internal_source."CUSTOMER_ID",
    "ORDER_DATE" = dbt_internal_source."ORDER_DATE",
    "STATUS" = dbt_internal_source."STATUS"
when not matched
then insert("ORDER_ID", "CUSTOMER_ID", "ORDER_DATE", "STATUS")
values ("ORDER_ID", "CUSTOMER_ID", "ORDER_DATE", "STATUS")

;*/
