
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`stock_analysis`
      
    
    

    OPTIONS()
    as (
      with

stock_analysis as ( select * from `first-project-262802`.`stock_analysis`.`int_stock_analysis` )

, symbols_meta as ( select * from `first-project-262802`.`stock_analysis`.`stg_symbols_meta` )

select
    *
from stock_analysis
left join symbols_meta using (symbol)
    );
  