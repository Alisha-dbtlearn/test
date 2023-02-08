{{
    config(
        materialized='table'
    )
}}

select * from {{ source('sample', 'orders') }}