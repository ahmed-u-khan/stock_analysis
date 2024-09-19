
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`stock_analysis`
      
    
    

    OPTIONS()
    as (
      with

stock_analysis as ( select * except (ETL_Date) from `first-project-262802`.`stock_analysis`.`int_all_stock_history` )

-- , symbols_meta as ( select * from `first-project-262802`.`stock_analysis`.`stg_symbols_meta` )

, symbols_meta as ( select * except (ETL_Date) from `first-project-262802`.`stock_analysis`.`stg_all_stock_info` )

select
    *
from stock_analysis
left join symbols_meta using (symbol)
    );
  