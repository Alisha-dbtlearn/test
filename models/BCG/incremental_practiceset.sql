{{
    config(
        materialized="incremental",
        unique_key="T_TIME",
        alias="incremental_sample",
        database="PRACTICETEST",
        schema="BCGSAMPLE",
    )
}}
select * 
from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
{% if is_incremental() %}
 where 
 T_TIME > (select max(T_TIME) from {{ this }})
        {% endif %}
