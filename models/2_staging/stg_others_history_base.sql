with 

stock as ( select * from {{ ref('base_all_others_stock_history') }} )

, calendar as ( select * from {{ ref('stg_calendar') }} )

, base as 
(
    select 
        *
        , round(((open + close_last + high + low)/4.00),2) as avg_daily_price
    from stock
    left join calendar using (date)
)

select * from base
