with

stock_analysis as ( select * from `first-project-262802`.`stock_analysis`.`int_stock_analysis` )

-- , symbols_meta as ( select * from `first-project-262802`.`stock_analysis`.`stg_symbols_meta` )

, symbols_meta as ( select * from `first-project-262802`.`stock_analysis`.`stg_all_nasdaq_stock_info` )

select
    *
from stock_analysis
left join symbols_meta using (symbol)