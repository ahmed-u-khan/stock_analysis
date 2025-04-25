{{ config(
    tags="4_final" 
) }}


select 
    *
from {{ ref('int_stock_analysis_1m') }}
