
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`stg_nasdaq_monthly_price_movement`
      
    
    

    OPTIONS()
    as (
      with 

base as ( select * from `first-project-262802`.`stock_analysis`.`stg_nasdaq_history_base` )

, first_avg_daily_price_per_month as 
(
    select 
        year_full
        , month_number
        , symbol
        , avg_daily_price as avg_daily_price_month_start
    from base
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, month_number, symbol ORDER BY date asc) = 1
)

, last_avg_daily_price_per_month as 
(
    select 
        year_full
        , month_number
        , symbol
        , avg_daily_price as avg_daily_price_month_end
    from base
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, month_number, symbol ORDER BY date desc) = 1
)

, daily_price_movement_in_month as 
(
    select
        year_full
        , month_number
        , symbol
        , round(avg_daily_price_month_end - avg_daily_price_month_start,2) as avg_daily_price_movement_in_month
        , round(((nullif(avg_daily_price_month_end,0)/nullif(avg_daily_price_month_start,0))-1)*100.00,2) as avg_daily_price_movement_in_month_pct
    from base
    left join first_avg_daily_price_per_month using (year_full, month_number, symbol)
    left join last_avg_daily_price_per_month using (year_full, month_number, symbol)
)






-- select
--     distinct *
-- from base
-- left join daily_price_movement_in_month using (year_full, month_number, symbol)

select * from daily_price_movement_in_month
    );
  