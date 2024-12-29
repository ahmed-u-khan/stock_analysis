
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`int_stock_analysis`
      
    
    

    OPTIONS()
    as (
      

with base as (

    select 
        * except (year_month, day_of_week)
        , year_month
        , day_of_week
        , concat(day_of_week," - ",day_abbrev) as day_of_week_and_name
        , volume as volume_per_day
        , volume / 390.00 as volume_per_minute
        , close_last as close
        , close_last as last
        
        -- , (high - low) as daily_price_range
        
        -- , (open - close_last) as daily_price_movement
        
        -- , avg_daily_price - lag (avg_daily_price) over (partition by symbol order by date asc) as avg_daily_price_movement_day_over_day
        
        -- , round( SAFE_DIVIDE( abs( close - open ) , ( LAG(avg_daily_price) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) *100.0,2) as daily_price_movement_as_pct_of_previous_day_avg_daily_price
        
        -- , round( SAFE_DIVIDE( abs( high - low ) , ( LAG(avg_daily_price) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) *100.0,2) as daily_price_range_as_pct_of_previous_day_avg_daily_price

    from `first-project-262802`.`stock_analysis`.`int_all_stock_history`

)

select 
    symbol
    , year_full
    , * except (year_full,symbol)
from base
    );
  