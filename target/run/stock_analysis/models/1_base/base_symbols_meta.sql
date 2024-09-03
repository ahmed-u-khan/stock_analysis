
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`base_symbols_meta`
      
    
    

    OPTIONS()
    as (
      select 
    'Nasdaq Traded' as is_nasdaq_traded
    , 'Symbol' as symbol
    , 'Security Name' as security_name
    , 'Listing Exchange' as listing_exchange
    , 'Market Category' as market_category
    , 'ETF' as is_ETF
    , 'Round Lot Size' as round_lot_size
    , 'Test Issue' as is_test_issue
    , 'Financial Status' as financial_status
    , 'CQS Symbol' as cqs_symbol
    , 'NASDAQ Symbol' as nasdaq_symbol
    , 'NextShares' as nextshares
from `first-project-262802`.`stock`.`symbols_valid_meta`
    );
  