{{
        config(
            materialized='incremental',
            alias='append',
            database='PC_DBT_DB',
            incremental_strategy='insert+overwrite',
            unique_key='order_id',
            schema='DBT_AKANUNGO',
            post_hook='INSERT INTO PC_DBT_DB.DBT_AKANUNGO.TEST SELECT * FROM {{this}}'
        )
    }}

    select 
    order_id,'overwrote' as status,current_timestamp created_at, current_timestamp updated_timestamp
    from PC_DBT_DB.DBT_AKANUNGO.mock_orders 
    {% if is_incremental() %}
        -- this filter will only be applied on an incremental run
        where created_at > (select max(created_at) from {{ this }}) 
    {% endif %}
    --DATEADD(DD,-3,current_timestamp)