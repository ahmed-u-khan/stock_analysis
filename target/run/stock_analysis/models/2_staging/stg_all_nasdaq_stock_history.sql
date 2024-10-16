
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`stg_all_nasdaq_stock_history`
      
    
    

    OPTIONS()
    as (
      with 

nasdaq_history_weekly_monthly_yearly_price as ( select * from `first-project-262802`.`stock_analysis`.`stg_nasdaq_history_weekly_monthly_yearly_price` )

, nasdaq_weekly_price_movement as ( select * from `first-project-262802`.`stock_analysis`.`stg_nasdaq_weekly_price_movement` )

, nasdaq_monthly_price_movement as ( select * from `first-project-262802`.`stock_analysis`.`stg_nasdaq_monthly_price_movement` )

, nasdaq_yearly_price_movement as ( select * from `first-project-262802`.`stock_analysis`.`stg_nasdaq_yearly_price_movement` )



select
    distinct *
from nasdaq_history_weekly_monthly_yearly_price
left join nasdaq_weekly_price_movement using (year_full, week_number, symbol)
left join nasdaq_monthly_price_movement using (year_full, month_number, symbol)
left join nasdaq_yearly_price_movement using (year_full, symbol)
    );
  