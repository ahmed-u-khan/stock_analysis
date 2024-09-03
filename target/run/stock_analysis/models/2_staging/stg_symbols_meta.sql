
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`stg_symbols_meta`
      
    
    

    OPTIONS()
    as (
      with 

symbols_meta as ( select * from `first-project-262802`.`stock_analysis`.`base_symbols_meta` )

select 
    symbol
    , security_name
    , listing_exchange
    , market_category
    , is_ETF
from symbols_meta
    );
  