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
from `first-project-262802`.`stock`.`all_nasdaq_stock_history`