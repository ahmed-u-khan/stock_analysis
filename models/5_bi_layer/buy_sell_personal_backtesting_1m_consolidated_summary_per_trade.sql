{{ config(
    tags="5_bi_layer" 
) }}


select 
    *
from {{ source('stock', 'buy_sell_personal_backtesting_1m_consolidated_summary_per_trade') }}
