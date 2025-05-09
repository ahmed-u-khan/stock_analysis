{{ config(
    tags="1_base" 
) }}

select	
    -- int64_field_0
    Date as date
    , Open as open
    , High as high
    , Low as low
    , Close as close_last
    , 'Adj Close' as adj_close
    , Volume as volume
    , Symbol as symbol
    , date(ETL_Date) as etl_date
from {{ source('stock', 'all_others_stock_history') }}