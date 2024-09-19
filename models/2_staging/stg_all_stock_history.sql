select * from {{ ref('base_all_nasdaq_stock_history') }}

union all

select * from {{ ref('base_all_others_stock_history') }}
