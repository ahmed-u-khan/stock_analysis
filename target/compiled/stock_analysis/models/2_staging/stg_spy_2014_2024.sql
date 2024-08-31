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

, weekly_stats as 
(
    select 
        year_full
        , week_number
        , round(avg(avg_daily_price),2) as avg_weekly_price
    from base
    group by 1,2
)


select
    *
from base
left join weekly_stats using (year_full,week_number)