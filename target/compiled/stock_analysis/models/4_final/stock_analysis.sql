



-- select 
--     *    
-- from `first-project-262802`.`stock_analysis`.`int_stock_analysis`




-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- for unioning new data into main table  -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 


-- with

-- new_data as (
--     select * from stock_analysis.int_stock_analysis
--     where date >= '2024-09-09'
-- )

-- , main_table as (
--     select * from stock_analysis.stock_analysis
--     where date < '2024-09-09'
-- )

-- select * from new_data
-- union all
-- select * from main_table





-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- --   used for adhoc creation  -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

select 
    *

    , (high - low) as daily_price_high_low_range
    
    , (open - close_last) as daily_price_open_close_range
    
    , avg_daily_price - lag (avg_daily_price) over (partition by symbol order by date asc) as avg_daily_price_diff_day_over_day -- -- how much does the avg daily price change day over day

    , round( ( SAFE_DIVIDE( (avg_daily_price) , ( LAG(avg_daily_price) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) -1 ) *100.0,2) as avg_daily_price_diff_pct_day_over_day  -- -- avg daily price change as pct of previous avg daily price 
    
    -- , round( SAFE_DIVIDE( abs( close - open ) , ( LAG(avg_daily_price) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) *100.0,2) as daily_price_movement_as_pct_of_previous_day_avg_daily_price
    
    -- , round( SAFE_DIVIDE( abs( high - low ) , ( LAG(avg_daily_price) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) *100.0,2) as daily_price_range_as_pct_of_previous_day_avg_daily_price    

from stock_analysis.stock_analysis