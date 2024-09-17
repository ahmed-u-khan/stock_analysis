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
    , '2024-09-16' as etl_date
from {{ source('stock', 'all_nasdaq_stock_history') }}