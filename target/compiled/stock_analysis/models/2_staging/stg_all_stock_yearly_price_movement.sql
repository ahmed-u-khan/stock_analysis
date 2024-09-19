with 

base as ( select * from `first-project-262802`.`stock_analysis`.`stg_all_stock_history_base` )

, first_avg_daily_price_per_year as 
(
    select 
        year_full
        , symbol
        , avg_daily_price as avg_daily_price_year_start
    from base
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, symbol ORDER BY date asc) = 1
)

, last_avg_daily_price_per_year as 
(
    select 
        year_full
        , symbol
        , avg_daily_price as avg_daily_price_year_end
    from base
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, symbol ORDER BY date desc) = 1
)

, daily_price_movement_in_year as 
(
    select
        year_full
        , symbol
        , round(avg_daily_price_year_end - avg_daily_price_year_start,2) as avg_daily_price_movement_in_year
        , round(((nullif(avg_daily_price_year_end,0)/nullif(avg_daily_price_year_start,0))-1)*100.00,2) as avg_daily_price_movement_in_year_pct
    from base
    left join first_avg_daily_price_per_year using (year_full, symbol)
    left join last_avg_daily_price_per_year using (year_full, symbol)
)









-- select
--     distinct *
-- from base
-- left join daily_price_movement_in_year using (year_full, symbol)

select * from daily_price_movement_in_year