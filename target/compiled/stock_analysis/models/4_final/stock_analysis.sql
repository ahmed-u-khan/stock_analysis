-- -- with

-- -- stock_analysis as ( select * except (ETL_Date) from `first-project-262802`.`stock_analysis`.`int_all_stock_history` )

-- -- select
-- --     *
-- -- from stock_analysis




-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- from int_all_stock_history -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- with 

-- all_stock_history_weekly_monthly_yearly_price as ( select * from `first-project-262802`.`stock_analysis`.`stg_all_stock_history_weekly_monthly_yearly_price` )

-- , all_stock_weekly_price_movement as ( select * from `first-project-262802`.`stock_analysis`.`stg_all_stock_weekly_price_movement` )

-- , all_stock_monthly_price_movement as ( select * from `first-project-262802`.`stock_analysis`.`stg_all_stock_monthly_price_movement` )

-- , all_stock_yearly_price_movement as ( select * from `first-project-262802`.`stock_analysis`.`stg_all_stock_yearly_price_movement` )



-- select
--     distinct *
-- from all_stock_history_weekly_monthly_yearly_price
-- left join all_stock_weekly_price_movement using (year_full, week_number, symbol)
-- left join all_stock_monthly_price_movement using (year_full, month_number, symbol)
-- left join all_stock_yearly_price_movement using (year_full, symbol)


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- --   used for adhoc creation  -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

select 
    *
    , close - open as daily_price_movement
    , round( SAFE_DIVIDE( abs( close - open ) , ( LAG(avg_daily_price) OVER (PARTITION BY symbol ORDER BY date ASC) ) ) *100.0,2) as daily_price_movement_as_pct_of_previous_day_avg_daily_price
from stock_analysis.stock_analysis