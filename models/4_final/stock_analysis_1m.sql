{{ config(
    tags="4_final" 
) }}


select 
    *
from {{ ref('stg_polygon_stock_histories_1m') }}
