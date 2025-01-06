
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`stock_analysis`
      
    
    

    OPTIONS()
    as (
      



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

    -- -- -- , (high - low) as daily_price_high_low_range
    
    -- -- -- , (open - close_last) as daily_price_open_close_range
    
    -- -- -- , avg_daily_price - lag (avg_daily_price) over (partition by symbol order by date asc) as avg_daily_price_diff_day_over_day -- -- how much does the avg daily price change day over day

    -- -- -- , round( ( SAFE_DIVIDE( (avg_daily_price) , ( LAG(avg_daily_price) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) -1 ) *100.0,2) as avg_daily_price_diff_pct_day_over_day  -- -- avg daily price change as pct of previous avg daily price 
    
    
    -- -- -- , ( ( open ) - ( LAG(close) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) as price_diff_of_open_to_close_of_previous_day
    -- -- -- , round( ( ( SAFE_DIVIDE( ( open ) , ( LAG(close) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_close_of_previous_day

    -- -- -- , ( ( close ) - ( LAG(close) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) as price_diff_of_close_to_close_of_previous_day
    -- -- -- , round( ( ( SAFE_DIVIDE( ( close ) , ( LAG(close) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_of_previous_day

    -- -- -- , ( ( high ) - ( LAG(close) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) as price_diff_of_high_to_close_of_previous_day
    -- -- -- , round( ( ( SAFE_DIVIDE( ( high ) , ( LAG(close) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_high_to_close_of_previous_day

    -- -- -- , ( ( low ) - ( LAG(close) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) as price_diff_of_low_to_close_of_previous_day
    -- -- -- , round( ( ( SAFE_DIVIDE( ( low ) , ( LAG(close) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_low_to_close_of_previous_day

    -- -- -- , LEAD(close,2) OVER (PARTITION BY symbol ORDER BY date ASC) - close as price_diff_of_close_to_close_2_trading_days_in_advance
    -- -- -- , round( ( ( SAFE_DIVIDE( ( LEAD(close,2) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( close ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_2_trading_days_in_advance

    -- -- -- , LEAD(close,3) OVER (PARTITION BY symbol ORDER BY date ASC) - close as price_diff_of_close_to_close_3_trading_days_in_advance
    -- -- -- , round( ( ( SAFE_DIVIDE( ( LEAD(close,3) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( close ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_3_trading_days_in_advance

    -- -- -- , LEAD(close,4) OVER (PARTITION BY symbol ORDER BY date ASC) - close as price_diff_of_close_to_close_4_trading_days_in_advance
    -- -- -- , round( ( ( SAFE_DIVIDE( ( LEAD(close,4) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( close ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_4_trading_days_in_advance
    
    -- -- -- , LEAD(close,5) OVER (PARTITION BY symbol ORDER BY date ASC) - close as price_diff_of_close_to_close_5_trading_days_in_advance
    -- -- -- , round( ( ( SAFE_DIVIDE( ( LEAD(close,5) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( close ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_5_trading_days_in_advance

    -- -- -- , LEAD(close,10) OVER (PARTITION BY symbol ORDER BY date ASC) - close as price_diff_of_close_to_close_10_trading_days_in_advance
    -- -- -- , round( ( ( SAFE_DIVIDE( ( LEAD(close,10) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( close ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_10_trading_days_in_advance

    -- -- -- , LEAD(close,15) OVER (PARTITION BY symbol ORDER BY date ASC) - close as price_diff_of_close_to_close_15_trading_days_in_advance
    -- -- -- , round( ( ( SAFE_DIVIDE( ( LEAD(close,15) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( close ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_15_trading_days_in_advance

    -- -- -- , LEAD(close,20) OVER (PARTITION BY symbol ORDER BY date ASC) - close as price_diff_of_close_to_close_20_trading_days_in_advance
    -- -- -- , round( ( ( SAFE_DIVIDE( ( LEAD(close,20) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( close ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_20_trading_days_in_advance

    -- -- -- , LEAD(close,25) OVER (PARTITION BY symbol ORDER BY date ASC) - close as price_diff_of_close_to_close_25_trading_days_in_advance
    -- -- -- , round( ( ( SAFE_DIVIDE( ( LEAD(close,25) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( close ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_25_trading_days_in_advance

    -- -- -- , LEAD(close,30) OVER (PARTITION BY symbol ORDER BY date ASC) - close as price_diff_of_close_to_close_30_trading_days_in_advance
    -- -- -- , round( ( ( SAFE_DIVIDE( ( LEAD(close,30) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( close ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_30_trading_days_in_advance

    -- -- -- , LEAD(close,45) OVER (PARTITION BY symbol ORDER BY date ASC) - close as price_diff_of_close_to_close_45_trading_days_in_advance
    -- -- -- , round( ( ( SAFE_DIVIDE( ( LEAD(close,45) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( close ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_45_trading_days_in_advance

    -- -- -- , LEAD(close,60) OVER (PARTITION BY symbol ORDER BY date ASC) - close as price_diff_of_close_to_close_60_trading_days_in_advance
    -- -- -- , round( ( ( SAFE_DIVIDE( ( LEAD(close,60) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( close ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_60_trading_days_in_advance

    -- -- -- , LEAD(close,90) OVER (PARTITION BY symbol ORDER BY date ASC) - close as price_diff_of_close_to_close_90_trading_days_in_advance
    -- -- -- , round( ( ( SAFE_DIVIDE( ( LEAD(close,90) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( close ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_90_trading_days_in_advance

    -- -- -- , round( ( ( SAFE_DIVIDE( ( close ) , ( LAG(close,2) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_of_2_days_ago
    -- -- -- , round( ( ( SAFE_DIVIDE( ( close ) , ( LAG(close,3) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_of_3_days_ago
    -- -- -- , round( ( ( SAFE_DIVIDE( ( close ) , ( LAG(close,4) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_of_4_days_ago
    -- -- -- , round( ( ( SAFE_DIVIDE( ( close ) , ( LAG(close,5) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_close_to_close_of_5_days_ago





    , ( ( open ) - ( LAG(open) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) as price_diff_of_open_to_open_of_previous_day
    , round( ( ( SAFE_DIVIDE( ( open ) , ( LAG(open) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_of_previous_day

    , LEAD(open,2) OVER (PARTITION BY symbol ORDER BY date ASC) - open as price_diff_of_open_to_open_2_trading_days_in_advance
    , round( ( ( SAFE_DIVIDE( ( LEAD(open,2) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( open ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_2_trading_days_in_advance

    , LEAD(open,3) OVER (PARTITION BY symbol ORDER BY date ASC) - open as price_diff_of_open_to_open_3_trading_days_in_advance
    , round( ( ( SAFE_DIVIDE( ( LEAD(open,3) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( open ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_3_trading_days_in_advance

    , LEAD(open,4) OVER (PARTITION BY symbol ORDER BY date ASC) - open as price_diff_of_open_to_open_4_trading_days_in_advance
    , round( ( ( SAFE_DIVIDE( ( LEAD(open,4) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( open ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_4_trading_days_in_advance
    
    , LEAD(open,5) OVER (PARTITION BY symbol ORDER BY date ASC) - open as price_diff_of_open_to_open_5_trading_days_in_advance
    , round( ( ( SAFE_DIVIDE( ( LEAD(open,5) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( open ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_5_trading_days_in_advance

    , LEAD(open,10) OVER (PARTITION BY symbol ORDER BY date ASC) - open as price_diff_of_open_to_open_10_trading_days_in_advance
    , round( ( ( SAFE_DIVIDE( ( LEAD(open,10) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( open ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_10_trading_days_in_advance

    , LEAD(open,15) OVER (PARTITION BY symbol ORDER BY date ASC) - open as price_diff_of_open_to_open_15_trading_days_in_advance
    , round( ( ( SAFE_DIVIDE( ( LEAD(open,15) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( open ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_15_trading_days_in_advance

    , LEAD(open,20) OVER (PARTITION BY symbol ORDER BY date ASC) - open as price_diff_of_open_to_open_20_trading_days_in_advance
    , round( ( ( SAFE_DIVIDE( ( LEAD(open,20) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( open ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_20_trading_days_in_advance

    , LEAD(open,25) OVER (PARTITION BY symbol ORDER BY date ASC) - open as price_diff_of_open_to_open_25_trading_days_in_advance
    , round( ( ( SAFE_DIVIDE( ( LEAD(open,25) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( open ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_25_trading_days_in_advance

    , LEAD(open,30) OVER (PARTITION BY symbol ORDER BY date ASC) - open as price_diff_of_open_to_open_30_trading_days_in_advance
    , round( ( ( SAFE_DIVIDE( ( LEAD(open,30) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( open ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_30_trading_days_in_advance

    , LEAD(open,45) OVER (PARTITION BY symbol ORDER BY date ASC) - open as price_diff_of_open_to_open_45_trading_days_in_advance
    , round( ( ( SAFE_DIVIDE( ( LEAD(open,45) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( open ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_45_trading_days_in_advance

    , LEAD(open,60) OVER (PARTITION BY symbol ORDER BY date ASC) - open as price_diff_of_open_to_open_60_trading_days_in_advance
    , round( ( ( SAFE_DIVIDE( ( LEAD(open,60) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( open ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_60_trading_days_in_advance

    , LEAD(open,90) OVER (PARTITION BY symbol ORDER BY date ASC) - open as price_diff_of_open_to_open_90_trading_days_in_advance
    , round( ( ( SAFE_DIVIDE( ( LEAD(open,90) OVER (PARTITION BY symbol ORDER BY date ASC) ) , ( open ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_90_trading_days_in_advance

    , round( ( ( SAFE_DIVIDE( ( open ) , ( LAG(open,2) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_of_2_days_ago
    , round( ( ( SAFE_DIVIDE( ( open ) , ( LAG(open,3) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_of_3_days_ago
    , round( ( ( SAFE_DIVIDE( ( open ) , ( LAG(open,4) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_of_4_days_ago
    , round( ( ( SAFE_DIVIDE( ( open ) , ( LAG(open,5) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) ) -1 ) * 100.00,2) as price_diff_pct_of_open_to_open_of_5_days_ago



    



from stock_analysis.stock_analysis
    );
  