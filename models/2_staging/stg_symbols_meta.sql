with 

symbols_meta as ( select * from {{ ref('base_symbols_meta') }} )

select 
    symbol
    , security_name
    , listing_exchange
    , market_category
    , is_ETF
from symbols_meta