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
        , case when cast( concat(hour,'.',trim( CAST( minute AS STRING FORMAT '00') )) as numeric ) >= 9.30 and cast( concat(hour,'.',trim( CAST( minute AS STRING FORMAT '00') )) as numeric ) < 16.0 then 1 else 0 end as minute_within_regular_trading_hours
        , case when cast( concat(hour,'.',trim( CAST( minute AS STRING FORMAT '00') )) as numeric ) < 9.30 then 1 else 0 end as minute_within_pre_market_trading_hours
        , case when cast( concat(hour,'.',trim( CAST( minute AS STRING FORMAT '00') )) as numeric ) >= 16.0 then 1 else 0 end as minute_within_post_market_trading_hours
    from stock
    left join calendar using (date)
)

select * from base
