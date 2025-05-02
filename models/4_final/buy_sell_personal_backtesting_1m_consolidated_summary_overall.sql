{{ config(
    tags="4_final" 
) }}


select 
    *
from {{ source('stock', 'buy_sell_personal_backtesting_1m_consolidated_summary_overall') }}
