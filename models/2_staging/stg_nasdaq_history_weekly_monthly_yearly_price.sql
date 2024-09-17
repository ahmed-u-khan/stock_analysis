with 

base as ( select * from {{ ref('stg_nasdaq_history_base') }} )

, weekly_price as 
(
    select 
        year_full
        , week_number
        , symbol
        , round(avg(avg_daily_price),2) as avg_weekly_price
        , round(sum(nullif(volume,0))/7) as avg_weekly_volume
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








select
    distinct *
from base
left join weekly_price using (year_full, week_number, symbol)
left join monthly_price using (year_full, month_number, symbol)
left join yearly_price using (year_full, symbol)
