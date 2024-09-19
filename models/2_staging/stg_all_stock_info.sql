select * from {{ ref('stg_all_nasdaq_stock_info') }}

union all

select * from {{ ref('stg_all_others_stock_info') }}
