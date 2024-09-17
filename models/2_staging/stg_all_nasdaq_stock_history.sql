with 

stock as ( select * from {{ ref('base_all_nasdaq_stock_history') }} )

, calendar as ( select * from {{ ref('stg_calendar') }} )

, base as 
(
    select 
        *
        , round(((open + close_last + high + low)/4.00),2) as avg_daily_price
    from stock
    left join calendar using (date)
)

, weekly_price as 
(
    select 
        year_full
        , week_number
        , symbol
        , round(avg(avg_daily_price),2) as avg_weekly_price
        , round(sum(volume)/7) as avg_weekly_volume
    from base
    group by 1,2,3
)

, monthly_price as 
(
    select 
        year_full
        , month_number
        , symbol
        , round(avg(avg_daily_price),2) as avg_monthly_price
    from base
    group by 1,2,3
)

, yearly_price as 
(
    select 
        year_full
        , symbol
        , round(avg(avg_daily_price),2) as avg_yearly_price
    from base
    group by 1,2
)




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
        , round(((avg_daily_price_week_end/avg_daily_price_week_start)-1)*100.00,2) as avg_daily_price_movement_in_week_pct
    from base
    left join first_avg_daily_price_per_week using (year_full, week_number, symbol)
    left join last_avg_daily_price_per_week using (year_full, week_number, symbol)
)




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
        , round(((avg_daily_price_month_end/avg_daily_price_month_start)-1)*100.00,2) as avg_daily_price_movement_in_month_pct
    from base
    left join first_avg_daily_price_per_month using (year_full, month_number, symbol)
    left join last_avg_daily_price_per_month using (year_full, month_number, symbol)
)






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
        , round(((avg_daily_price_year_end/avg_daily_price_year_start)-1)*100.00,2) as avg_daily_price_movement_in_year_pct
    from base
    left join first_avg_daily_price_per_year using (year_full, symbol)
    left join last_avg_daily_price_per_year using (year_full, symbol)
)




select
    distinct *
from base
left join weekly_price using (year_full, week_number, symbol)
left join monthly_price using (year_full, month_number, symbol)
left join yearly_price using (year_full, symbol)
left join daily_price_movement_in_week using (year_full, week_number, symbol)
left join daily_price_movement_in_month using (year_full, month_number, symbol)
left join daily_price_movement_in_year using (year_full, symbol)

