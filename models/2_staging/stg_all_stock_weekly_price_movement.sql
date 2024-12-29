{{ config(
    tags="2_staging" 
) }}

with 

base as ( select * from {{ ref('stg_all_stock_history_base') }} )

, first_avg_daily_price_per_week as 
(
    select 
        year_full
        , week_number
        , symbol
        , avg_daily_price as avg_daily_price_week_start
    from base
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, week_number, symbol ORDER BY date asc) = 1
)

, last_avg_daily_price_per_week as 
(
    select 
        year_full
        , week_number
        , symbol
        , avg_daily_price as avg_daily_price_week_end
    from base
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, week_number, symbol ORDER BY date desc) = 1
)

, daily_price_movement_in_week as 
(
    select
        year_full
        , week_number
        , symbol
        , round(avg_daily_price_week_end - avg_daily_price_week_start,2) as avg_daily_price_movement_in_week
        , round(((nullif(avg_daily_price_week_end,0)/nullif(avg_daily_price_week_start,0))-1)*100.00,2) as avg_daily_price_movement_in_week_pct
    from base
    left join first_avg_daily_price_per_week using (year_full, week_number, symbol)
    left join last_avg_daily_price_per_week using (year_full, week_number, symbol)
)






-- select
--     distinct *
-- from base
-- left join daily_price_movement_in_week using (year_full, week_number, symbol)

select distinct * from daily_price_movement_in_week