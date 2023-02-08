{% snapshot mock_orders %}


    
    {{
        config(
            target_database='PC_DBT_DB',
            alias='dim_mock_orders',
            target_schema='DBT_AKANUNGO',
            unique_key='order_id',
            strategy='timestamp',
            updated_at='updated_at'
        )
    }}

    select * from PC_DBT_DB.DBT_AKANUNGO.mock_orders
 
 {% endsnapshot %}
