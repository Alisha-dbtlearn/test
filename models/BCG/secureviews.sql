{{
    config(
        materialized='view',
        snowflake_warehouse='compute_wh',
        database='PC_DBT_DB',
        query_tag ='Secure_view_dbt_test',
        secure= true
        

    )
}}

select * from {{source('jaffle_shop', 'orders') }}

--01aa3164-0000-f65f-0003-747a0002511a
