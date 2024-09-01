with 

spy_2014_2024 as ( select * from `first-project-262802`.`stock_analysis`.`base_spy_2014_2024` )

, calendar as ( select * from `first-project-262802`.`stock_analysis`.`stg_calendar` )

, base as 
(
    select 
        *
        , round(((open + close_last + high + low)/4.00),2) as avg_daily_price
    from spy_2014_2024
    left join calendar using (date)
)

, weekly_price as 
(
    select 
        year_full
        , week_number
        , round(avg(avg_daily_price),2) as avg_weekly_price
    from base
    group by 1,2
)

, monthly_price as 
(
    select 
        year_full
        , month_number
        , round(avg(avg_daily_price),2) as avg_monthly_price
    from base
    group by 1,2
)




, first_avg_daily_price_per_week as 
(
    select 
        year_full
        , week_number
        , avg_daily_price as avg_daily_price_week_start
    from base
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, week_number ORDER BY date asc) = 1
)

, last_avg_daily_price_per_week as 
(
    select 
        year_full
        , week_number
        , avg_daily_price as avg_daily_price_week_end
    from base
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, week_number ORDER BY date desc) = 1
)

, daily_price_movement_in_week as 
(
    select
        year_full
        , week_number
        , round(avg_daily_price_week_end - avg_daily_price_week_start,2) as avg_daily_price_movement_in_week
    from base
    left join first_avg_daily_price_per_week using (year_full,week_number)
    left join last_avg_daily_price_per_week using (year_full,week_number)
)




, first_avg_daily_price_per_month as 
(
    select 
        year_full
        , month_number
        , avg_daily_price as avg_daily_price_month_start
    from base
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, month_number ORDER BY date asc) = 1
)

, last_avg_daily_price_per_month as 
(
    select 
        year_full
        , month_number
        , avg_daily_price as avg_daily_price_month_end
    from base
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, month_number ORDER BY date desc) = 1
)

, daily_price_movement_in_month as 
(
    select
        year_full
        , month_number
        , round(avg_daily_price_month_end - avg_daily_price_month_start,2) as avg_daily_price_movement_in_month
    from base
    left join first_avg_daily_price_per_month using (year_full,month_number)
    left join last_avg_daily_price_per_month using (year_full,month_number)
)




select
    distinct *
from base
left join weekly_price using (year_full,week_number)
left join monthly_price using (year_full,month_number)
left join daily_price_movement_in_week using (year_full,week_number)
left join daily_price_movement_in_month using (year_full,month_number)