
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`stg_others_history_base`
      
    
    

    OPTIONS()
    as (
      with 

stock as ( select * from `first-project-262802`.`stock_analysis`.`base_all_others_stock_history` )

, calendar as ( select * from `first-project-262802`.`stock_analysis`.`stg_calendar` )

, base as 
(
    select 
        *
        , round(((open + close_last + high + low)/4.00),2) as avg_daily_price
    from stock
    left join calendar using (date)
)

select * from base
    );
  