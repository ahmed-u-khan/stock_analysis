with

nasdaq_ticker_history as ( select * from `first-project-262802`.`stock_analysis`.`stg_all_nasdaq_stock_history` )

, nasdaq_ticker_info as ( select * from `first-project-262802`.`stock_analysis`.`stg_all_nasdaq_stock_info` )

select
    *
from nasdaq_ticker_history
left join nasdaq_ticker_info using (symbol)