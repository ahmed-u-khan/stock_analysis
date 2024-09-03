with

stock_analysis as ( select * from {{ ref('int_stock_analysis') }} )

, symbols_meta as ( select * from {{ ref('stg_symbols_meta') }} )

select
    *
from stock_analysis
left join symbols_meta using (symbol)