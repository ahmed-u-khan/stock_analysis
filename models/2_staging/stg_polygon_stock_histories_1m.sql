{{ config(
    tags="2_staging" 
) }}

with 

stock as ( select * from {{ ref('base_polygon_stock_histories_1m') }} )

, calendar as ( select * from {{ ref('stg_calendar') }} )

, base as 
(
    select 
        *
        , round(((open + close + high + low)/4.00),2) as avg_minute_price
    from stock
    left join calendar using (date)
)

select * from base
