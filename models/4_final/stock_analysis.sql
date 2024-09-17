with

stock_analysis as ( select * from {{ ref('int_stock_analysis') }} )

-- , symbols_meta as ( select * from {{ ref('stg_symbols_meta') }} )

, symbols_meta as ( select * from {{ ref('stg_all_nasdaq_stock_info') }} )

select
    *
from stock_analysis
left join symbols_meta using (symbol)