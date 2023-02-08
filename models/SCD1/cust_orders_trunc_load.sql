{{
    config(
        materialized= 'incremental',
        incremental_strategy= 'delete+insert',
        pre_hook= 'delete from {{this}}',
        alias= 'cust_total_trunc_load'
    )
}} 

select *, '1st_load' as load_count from {{ ref('dim_customer_orders') }}
