-- -- with

-- -- stock_analysis as ( select * except (ETL_Date) from {{ ref('int_all_stock_history') }} )

-- -- select
-- --     *
-- -- from stock_analysis




-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- from int_all_stock_history -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

with 

all_stock_history_weekly_monthly_yearly_price as ( select * from {{ ref('stg_all_stock_history_weekly_monthly_yearly_price') }} )

, all_stock_weekly_price_movement as ( select * from {{ ref('stg_all_stock_weekly_price_movement') }} )

, all_stock_monthly_price_movement as ( select * from {{ ref('stg_all_stock_monthly_price_movement') }} )

, all_stock_yearly_price_movement as ( select * from {{ ref('stg_all_stock_yearly_price_movement') }} )



select
    distinct *
from all_stock_history_weekly_monthly_yearly_price
left join all_stock_weekly_price_movement using (year_full, week_number, symbol)
left join all_stock_monthly_price_movement using (year_full, month_number, symbol)
left join all_stock_yearly_price_movement using (year_full, symbol)


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- --   used for adhoc creation  -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- select * from stock_analysis.stock_analysis
-- left join stock.symbols_meta_data using (symbol)