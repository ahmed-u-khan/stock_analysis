with

stock_analysis as ( select * except (ETL_Date) from {{ ref('int_all_stock_history') }} )

-- , symbols_meta as ( select * from {{ ref('stg_symbols_meta') }} )

, symbols_meta as ( select * except (ETL_Date) from {{ ref('stg_all_stock_info') }} )

select
    *
from stock_analysis
left join symbols_meta using (symbol)